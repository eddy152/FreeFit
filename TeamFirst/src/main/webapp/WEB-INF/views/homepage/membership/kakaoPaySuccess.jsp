<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
īī�����̼�����
<br>
īī������ ������ ���������� �Ϸ�Ǿ����ϴ�.
 
�����Ͻ�:     [[${info.approved_at}]]<br/>
�ֹ���ȣ:    [[${info.partner_order_id}]]<br/>
��ǰ��:    [[${info.item_name}]]<br/>
��ǰ����:    [[${info.quantity}]]<br/>
�����ݾ�:    [[${info.amount.total}]]<br/>
�������:    [[${info.payment_method_type}]]<br/>
${info }
</body>
</html>