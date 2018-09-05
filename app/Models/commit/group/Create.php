<?php
/**
 * Created by PhpStorm.
 * User: leexiaohui(oranzh.cc@gmail.com)
 * Date: 2018/8/8
 * Time: 14:14
 */

namespace app\Models\commit\group;


use app\Models\dao\Group;
use Server\CoreBase\ChildProxy;
use Server\CoreBase\Model;
use app\Exception\BlueWarningException;
use app\Models\dao\GroupPassport;

class Create extends Model
{
    private $dGroup;
    private $dGroupPassport;
    private $table = 'groups';
    private $table_group_passport = 'group_passport';
    public function __construct($proxy = ChildProxy::class)
    {
        parent::__construct($proxy);
    }
    public function initialization(&$context)
    {
        parent::initialization($context); // TODO: Change the autogenerated stub
        $this->dGroup = $this->loader->model(Group::class,$this);
        $this->dGroupPassport = $this->loader->model(GroupPassport::class,$this);
    }

    public function perform()
    {
        $params = $this->context['commit'];
        $params['create_time'] = $params['update_time'] = time();
        $group = $this->dGroup->getFromName($params['name']);
        if (!empty($group)) throw new BlueWarningException('群组已经存在');
        $this->db->begin(function () use ($params)
        {
            $res = $this->db->insert($this->table)->set($params)->query()->getResult();
            if (!$res) throw new BlueWarningException('添加失败');
            $data = [
                'group_id' => $res['insert_id'],
                'passport' => $params['leader'],
                'create_time' => time(),
                'update_time' => time(),
            ];
            $rows = $this->db->insert($this->table_group_passport)->set($data)->query()->affected_rows();
            if ($rows != 1) throw new BlueWarningException('添加失败');
            $this->redis->sAdd('group_id_'.$res['insert_id'],$params['leader']);
        },function (){
            throw new BlueWarningException('添加失败12');
        });
    }
}