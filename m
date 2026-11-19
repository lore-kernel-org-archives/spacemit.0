Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.205.208.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095495;
	b=L7jBcxmt2kkQzsNJS+QdIZeecKEpF1e7FeSfS1HVRcGwWHmms1n2uQKXH8p+QVpSwUpE
	 tVvrfVv/ghGsy8SV0tJeUAJgImvCpb68YUl30ugwGT8Ze6vHuTaaCWHWLxlohPOCh/GSA
	 lItD3k9KKbj3K+lvnTHY8iPGkNUtAYN92C6i69uta0WNfsJJ5YvlAeHFYvGHPpPSsfWY2
	 i6TpKQWyy27erJ/HWTUKElV8II61/DzyZhJizNyf/izScJKBCIEqj3UzbsSuI/6Cd4iVx
	 978KxwekBD+PBHb0s4xxNEliYxEyFuhhlbddfR96y+dNd8gKkGDO9ocY2Fb7+druzvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095495;
	h=DMARC-Filter:X-AliDM-RcptTo:Feedback-ID:DKIM-Signature:Received:
	 X-EnvId:Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:
	 From:To:Date:Message-ID:List-Unsubscribe:List-Unsubscribe-Post:
	 Reply-To;
	bh=4kZ4Hbf9Ip8FdqH6Hl2r2Au7c5UfXZBH4niXoxnwLWw=;
	b=JffZ4KxA1oYlzYxL0tF9HKsn4Fd7Spi4r7489cxbN9U1filXnAoHryUTAA4i9h92JEkr
	 CSVHZsENk8sa5DeBIxvRxTGprA1wg2n1Fgim5A8T4EDezgemp3K6Hsb1rzY/B6QQGIddv
	 NVmdlUmEvWaOGpaV8Kz/fr0Gt2Ot9wmahVppH/CzJK2QNrDjZLw5eNe6EPfkw3Go4l1zN
	 F769iWch0WrzJ2/XRrGIwl3YT1/OHbo2sAH+GW5hgrA5hIFVTmWE/uLGYRggjfO26ENTs
	 kOlruclfSmthjh3wxSx1H/DbfVyrcUFcShE5owMmX9jSe3gPySP+NJRTzG4lbAnuLgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=token8341.com;
	spf=pass smtp.mailfrom=token8341.com;
	dkim=pass header.d=token8341.com header.i=@token8341.com header.a=rsa-sha256 header.s=aliyun-cn-hangzhou header.b="Y/QuF/LZ";
	arc=none smtp.remote-ip=140.205.208.128
Received: from out208-128.dm.aliyun.com (out208-128.dm.aliyun.com [140.205.208.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEB2606A324
	for <spacemit@lists.linux.dev>; Thu, 19 Nov 2026 13:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEB2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=token8341.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=token8341.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=token8341.com header.i=@token8341.com header.a=rsa-sha256 header.s=aliyun-cn-hangzhou header.b=Y/QuF/LZ
X-AliDM-RcptTo: c3BhY2VtaXRAbGlzdHMubGludXguZGV2
Feedback-ID: default:corp@token8341.com:vip_edm_SmtpBatch:555662
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=token8341.com; s=aliyun-cn-hangzhou;
	t=1795095486; h=Content-Type:MIME-Version:Subject:From:To:Date:Message-ID:List-Unsubscribe:List-Unsubscribe-Post;
	bh=4kZ4Hbf9Ip8FdqH6Hl2r2Au7c5UfXZBH4niXoxnwLWw=;
	b=Y/QuF/LZh7X9eg0vYsGolOAwThBfeVt2DZZxsS2gLgpT67zq5rFqm64dfVFX0t5+DUsQikjUOYsmHoQVL35ClLxeR+CX8mpQFZEGrWvI7caLCYf3VSUfieRtFrk0Koi4Q/CvfkIJIRMVM199b0jm1/lLKQAAKX4d8qrDsTreu+s=
Received: from localhost.localdomain(mailfrom:corp@token8341.com fp:SMTPD_-VHcGaGhzev cluster:AY35D)
          by smtpdm.aliyun.com(127.0.0.1);
          Thu, 19 Nov 2026 21:38:05 +0800
X-EnvId: 600000375297669831
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: =?utf-8?q?token8341_=E2=80=94_an_API_partner_for_your_project?=
From: TokenWorks <corp@token8341.com>
To: spacemit@lists.linux.dev
Date: Thu, 19 Nov 2026 21:38:05 +0800
Message-ID: <179509548555.2361083.14517987338156042220@token8341.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Reply-To: wuqiong@token8341.com

5L2g5aW977yMCgrmiJHku6zlubPlj7AgdG9rZW44MzQx77yIdG9rZW44MzQxLmNvbe+8ieaPkOS+
myBBSSDlpKfmqKHlnosgQVBJIOiBmuWQiOacjeWKoe+8jArkuIDkuKoga2V5IOiwg+eUqCBEZWVw
U2Vla+OAgUtpbWnjgIHmmbrosLEgR0xN44CB6YCa5LmJ5Y2D6Zeu44CBTWluaU1heCDnrYnmqKHl
novvvIwK5a6M5YWo5YW85a65IE9wZW5BSSBTREvjgIIKCuaDs+i3n+S9oOiBiuiBiuaYr+WQpuac
ieWQiOS9nOWPr+iDveOAguWbnui/meWwgemCruS7tuWwseiDveaJvuWIsOaIkeOAguiwouiwou+8
gQoKLS0tCuWQtOeQvAp0b2tlbjgzNDEKaHR0cHM6Ly93d3cudG9rZW44MzQxLmNvbQoKLS0K5aaC
6L+Z5bCB6YKu5Lu25a+55oKo5rKh5pyJ5biu5Yqp77yM5Zue5aSN5Lu75oSP5YaF5a655Y2z5Y+v
77yM5oiR5Lya5bCG5oKo6L2s6Iez5LiN5omT5omw5ZCN5Y2V77yM5ZCO57ut5LiN5YaN5omT5omw
44CC
