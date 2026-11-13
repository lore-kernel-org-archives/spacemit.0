Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595949;
	b=EvnWS48akc/pFcbBZyJc4iDr8safhasC+4wPeFSm8qLYZIr4Py1+XELJ4SvqmU6/b4aY
	 mq+xobg8NI7t8EkJy1/LaLPjVRmL9QuJufAqL0OKW/NGFH3kAwaSvBn+Ln+1VXwIm8N1Q
	 MB26ycFi1dazcUZZdQGJOzqYW5Qhj7PITdYY19yxDH6Zdzc9fjMIAPpusFT5sAtsLl0GD
	 9vo2AB+NAIDGDuvNGj2g5Tp4FaEf0BtYtCqzH+oxa08VH+kwTIoEE7YB3INW28t3A1DKO
	 j9RCXtv9It42WJuNaC6Cxz3S/Zcs5uq3zVa21CAYBjwZhC4B7FPilghr7EDKp/fwEvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
	b=zZAo9Lga0azSguvACNnRpwugCZEpncGfYxelW2XzNhpJ3lw3NCqdubmRQbdMOoyLwnDB
	 CvvCFnAwdW4dteXvkYBmuDSzBEhlBJwoP/xuGE03mHsaOn1Fnq7pBu+VtBIMWYNnp+7YG
	 ZWmhRNiV3pB4p8u0vpEBG9H8waf1fRglI/rH2REBkDR0UXpj7DlG+cQ5BjLYs/z8btgMP
	 VWnzeoN4O03enX2Tbvju7/pYeXphT5xqxHXFpdYOYiSsvkmdykfGAO5x1kkjhTWbhSCWa
	 X75wKv+8Z9uAFIuJqnY4y/9iLMGAARfxHq9LcxnVwc6oNr+lHlAdEvQHrbTuD81Q5yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kH3lOc2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oilldg5u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2A606A332
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 18:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64F2A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kH3lOc2/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oilldg5u
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRRLJ3296039
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 18:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SkPg5/GgZz/
	9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=; b=kH3lOc2/yjDZLOgjOBq1LJrx/uc
	BfQYSDeU2aQnW4rMH1CNs0uAvLb2uAHJxTgwHFXviP3xSLTuHedKmRex5+sJEUwk
	KWWRbBnsPOD8lHRrty8uXSYX4ByM8ho6zL4byOafDMPqAm4hzToTVFRFTdb30By9
	8ovLMRlCqkoFWMhFTOAG7zx6RmIUa2I5sSIcWEyZ62F3Exa13GrqLYp0WQXdI7sg
	BYRr0+ofVPhKE1vK+gzFVKO9bQFWloVxuqtNjRBaziwcatt5AcVkdPuBBuTO4Wpg
	hNWwHZuJ4fxTXZmVgZcZkKXiZBDZgkk7IUVRsBfrNkomupeQnU4bcVjvrbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tpdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 18:52:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so282171085a.3
        for <spacemit@lists.linux.dev>; Fri, 13 Nov 2026 10:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794595948; x=1795200748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=Oilldg5uHVsVY3ITjYkulWZPdJzBTL01ftLYXlGv2a897xgKaml1CiGK0CD51FAa0F
         HVYkNdB/y66Tg/tVI8I+EeHhsuTBK7pwzDOTHC2hREGzSnsRCDxGI79zkh0NKmdY78P9
         NRiffYjAQEwZe0LWzJIF3cjPioJO1NE6Fd2KkFDNVD34avmh6mETlXwZmQkNxMUcPjnP
         XEeR857J/GnD9sBvO8i3xbDbDeKpL1AYSC+Rav5VR7/+QwfQLQK89CIZbL6RDAyrwqd6
         V+XF5qgRGloqGnMKzzu9gfrMXJh/htW+5jp9ZUD5ZuUMKFo1F9srCe72K3FqQ0R/49//
         6l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595948; x=1795200748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkPg5/GgZz/9jZGD+lV7fPET50UBkjcaQ9AOlcrVhSE=;
        b=CSpdkrLzIqSdGXt2aEGIBJFU5tGWX2Svo2kYjs8kM+CS4Ap7Te2xemeokZV9LvOkdt
         vEi51eaYsMa1no2S5aRmY6ycsLMu2LVs9WVggkqk/YIiLCcJMDZ5a0ApUbQMKGXkaePT
         YduhBPekQV4EHAl2umMIfPPgNOyxVvrUSn9mD2ovCTLxR90J39u/5hAF7nOTpyr1mitT
         LA0/1tvi+CuCrT22o/xYf1SfdLu9D2CfUXKiHfSwrJbc8+hUSJM9m6Yy9qprSHz27mD6
         JoD997ZqfOhAHq5N5txwk+CxH/CEl7AoMvzAggBgRe/wKD07j+W/TzCctr1v869BE0Pk
         rXRw==
X-Forwarded-Encrypted: i=1; AL+hErE1SLUln/gemjq4ResqEkV7wVV1SC4t7V+N/Pg4XwzNpvB4oe1gskFfqWOB15pdWvbCCAzH56GvMA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9l8JzwOulCOskWZQSLdYSUY+S21eYJfMZ2n7SWZdM54FocEoJ8
	C0TcOfzmsTer+a73v+mBQ6NzFKCQ/9osfkyFA2kB2QGwd/+/CGPX90socTNk1JMzCS6CD40Ua2B
	Nzgy5Hir5W4Xd+VbOMllQKcQdPLGR4KgX9Qh2t59ZtAbS9TqPYkQbSOtTjodEFw==
X-Gm-Gg: AYBFou0XhAo5ChUhPRVPEJ1GWFuwpJe6Mk+7KbcNGGFDDlHwd+rKHHseimIzqP1Zl6y
	oOIflm9kGwfQ+ST68bWMzmrS5Pm69cC2eYAz1sg84QSOwibMKAwJGCnEp2SyZWr8MCK0xmMO/cu
	5mEilhuK62LI4HbAQw/Je0MgUBIWuWhLr3crOesrQ6P+XMy6DuVvs7lRVe6+U4cJilctb6scsbe
	ZXNcL3Q02PR3/+JAJ06ryfoQAYvONnOuiG65Vvo+YmltolhzuMP33ktuamz/CYRW1/ludheSi46
	PZbkOE4tK998vblWPRU3cV2Qdl9h5k/qorIuN7HWi38WFCh6maaDHbI4LqDwti3XTTROuFrRDoM
	4Ou+rQUY290CRcxugtlh3068I8e0jGGzKz4yrMlPYyCGr5xYeQQW3/nnSOM/czA==
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549345485a.17.1794595947609;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:949:3644:edc0 with SMTP id af79cd13be357-9494bb82d66mr549343185a.17.1794595947195;
        Fri, 13 Nov 2026 10:52:27 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm7366316f8f.45.2026.11.13.10.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:52:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: k1: Correct missing space
Date: Fri, 13 Nov 2026 19:52:16 +0100
Message-ID: <20261113185214.182695-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185214.182695-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=704; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ydlWfHv8KMdXhcil2lvko+LTGW6saAZRv+JES4jy7+c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91xf5vzRttUphxuP6s8niqvoRGePP05uJmg+y
 NWC57ZpAcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcXwAKCRDBN2bmhouD
 1wFuD/9Xs/3OZFXRUKqYiOXZBAwBmVbvbBExEfwlLHe6jS6qAFeHhQhGL93Ylpvv0Td7tCZDuUX
 WDn78xTjPkwg9CrrdNAjva2vQbdhcof5jz/fKvdgVSfBVsTHp10jzmaM6LdWVJJIOOliC/Z+PYN
 YGxIYLaDhMTfHVGqnrFFeCcexaPbUdcgyc9Mkwwpg2aCzzZQmXnyD2S3dLS7tuzcg3XzzQB7HFP
 RSDduEsrSiEydijcnyi4DYc6bM2e1wnkHgATFGNu5bdwsbiceQifIa+3I9Ouoy7V1tNL4/zd3s3
 DM+H5aTQlvR2Ak68bKMHkGIStfFwm6EHTvMvUzHkP3+x/V/SYlptDg11lii/WF+D8Kji7Svt0B+
 JZEB2ki616RlV0IsXSM+Ot3bDpXr1tWObZC6RVSn+YmUx+VYAkzI+p2NhDr/JtwhUq3gWfJlmHz
 273J6ggcHKGw1epcLbx/agjKjxjb6DWAnNqxkps4A4r91f8nd3y8KKKbUNrN0/nB/gOUj3OvNS6
 94r7g0EOWYWYE39vbF8mMkRkzKYFAnLhz1/wDT2ja7rilDldE8bzRt14CcWBjwXSFBf+2JtdnS6
 iJmiRJOrRF27jLm2zwfqc5pCnLb6Ss9KTp9ncmYQrbEEVn87GS/1mUuHUqHPQYFb2YeOiGoSWlF riL0FHR4e2KJsQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXzNxyoA8NSaSD
 bkgOl/tsuGHZlHtj9FeLCiFwX08s07ynEDEoWreUciHwhRl0YTyzyCbiHvRpnMe36d2i6WrIeLj
 szRzFWzSAQHLFG3eQmW9tHw9s25PFz2SzNOKKSOmJqxWXee24+CbtpaqtH4QRtAP/OGl3FR93Zl
 uREkBJArBYwxtDkX+glJq6voQPWTdXQLIK5d1NmE21EQSQWWzcjFXMnZzus+8JhrKf4+TxzPlPu
 to6HHv++TsPYu0stohZRLiE6cINVveud3qc9w58MrP43d8lfsANz3br2Fju2FMagKPkSIEsr7Wp
 nVU3xLMRDc1TbLoP7GiOmXgJH5hrXgOtfICK0yppnjsWQu8tXCVtlBVCAQN1jQ5IkrrgHYh7ASW
 IjOEKuuq/1NszeDKWcNTqMw0Boo0nXTmHuAnhYA5ZoZy/vHvbDhZ7YCb93iCczKkB04aAG1V4qG
 kgGN62p2qNfBVrdI5qA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/t72Zv7kfqBc
 7Y70MnoEYwqF/pTurYEf0vyE1bFm1zrqjFQ92aMeHqp7GPX8xxU04AUKHrPuzWPfhPwSN9lwvht
 odRPkGm8j7fE9APHgpZEoNPquXx2eCg=
X-Proofpoint-GUID: jbQkxsshEABfLqz-JpeeixOmtxsJsySY
X-Proofpoint-ORIG-GUID: jbQkxsshEABfLqz-JpeeixOmtxsJsySY
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af75c6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=85fTqwSHmoAmm6HRS_YA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..5d5f7f8a393d 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -948,7 +948,7 @@ pdma: dma-controller@d4000000 {
 				resets = <&syscon_apmu RESET_DMA>;
 				interrupts = <72>;
 				dma-channels = <16>;
-				#dma-cells= <1>;
+				#dma-cells = <1>;
 				status = "disabled";
 			};
 
-- 
2.53.0

