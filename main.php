/**
* Какие сущности вы создате и какой код поместите в контроллер?
*
* Таблица basket имеет следующий вид:
* id - integer
* good_id - integer
* quantity - integer
* user_id - integer
* created_at - datetime
*/

class BasketController extends Controller
{
    public function actionAdd()
    {
        if(isset(Yii::$app->request->post()['good_id']) && $GoodModel::findOne(Yii::$app->request->post()['good_id'])){
            $model = new BasketForm();
            if ($model->load(Yii::$app->request->post()) && $model->validate()) {
                if ($row = $model->add()) // BasketModel
                {
                    return json_encode([
                        'success'   => true,
                        'id'        => $row->id,
                    ]);
                }
            }
        }

        return json_encode([
            'success'   => false,
        ]);
    }

    public function actionClear()
    {
        $rows = BasketModel::findAll(['user_id'] => Yii::$app->user->id);

        foreach($rows as $row){
            $model->remove($row->id);
        }

        return json_encode([
            'success'   => true,
        ]);
    }

    public function actionRemove($id)
    {
        if($model = BasketModel::findOne($id) && $model->remove($id)){
            return json_encode([
                'success'   => true,
            ]);
        }

        return json_encode([
            'success'   => false,
        ]);
    }
}
