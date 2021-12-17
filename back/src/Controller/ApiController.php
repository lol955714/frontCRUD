<?php

namespace App\Controller;

use ProxyManager\Factory\RemoteObject\Adapter\JsonRpc;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class ApiController extends AbstractController
{
    /**
     * @var integer HTTP status code - 200 (ok) by default
     */
    protected $statusCode = 200;

    /**
     * @return integer
     */
    public function getStatusCode(){
        return $this->statusCode;
    }
    /**
     * @param integer $statusCode the status code
     * @return self
     */
    protected function setStatusCode($statusCode){
        $this->statusCode=$statusCode;
        return $this;
    }
    /**
     * @param array $data
     * @param array $headers
     * @return JsonResponse
     */
    public function response($data, $headers=[]){
        return new JsonResponse($data, $this->getStatusCode(), $headers);
    }

    /**
     * @param string $errors
     * @param $headers
     * @return JsonResponse
     */
    public function respondWithErrors($errors, $headers=[]){
        $data=[
            'status'=>$this->getStatusCode(),
            'Errors'=>$errors,
        ];
        return new JsonResponse($data, $this->getStatusCode(),$headers);
    }
    /**
     * @param string $sucess
     * @param $headers
     * @return JsonResponse
     */
    public function respondWithSuccess($success, $headers=[]){
        $data=[
            'status'=>$this->getStatusCode(),
            'success'=>$success,
        ];
        return new JsonResponse($data,$this->getStatusCode(),$headers);
    }
    /**
     * @param string $message
     * @return JsonResponse
     */
    public function respondUnauthorized($message = 'Not authorized'){
        return $this->setStatusCode(401)->respondWithErrors($message);
    }
    /**
     * @param string $message
     * @return JsonResponse
     */
    public function RespondValidationError($message='Error en validaci{on'){
        return $this->setStatusCode(422)->respondWithErrors($message);
    }
    /**
     * param string $message
     * @return JsonResponse
     */
    public function respondNotFound($message='no se encontró'){
        return $this->setStatusCode(404)->respondWithErrors($message);
    }
    /**
     * @param array $data
     * @return JsonResponse
     */
    public function respondCreated($data=[]){
        return $this->setStatusCode(201)->response($data);
    }
    protected function transformJsonBody(Request $request){
        $data=json_decode($request->getContent(), true);
        if ($data === null){
            return $request;
        }
        $request->request->replace($data);
        return $request;
    }
}
