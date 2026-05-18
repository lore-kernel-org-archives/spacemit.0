Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9DA220698
	for <spacemit@lists.linux.dev>; Mon, 18 May 2026 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129959; cv=none; b=oS1CvKyPnfZ8BK8nZG9qvMAHKlmXWuylfOBCJEdKkFx76bw25fGZrBW+ruS4jFWA+qwL2R6rXI/xZMSOcKvJBouawHNV+GNcingJZIMjPY/6Lesn/sxOldX5kGEVWVcszw13D48feP7xioQEklpDFWZ+tXDF84BdY9bQBMiOrsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129959; c=relaxed/simple;
	bh=Yu9Zwk7TGK2LLiay646XMZI1OzTnaKo2CIhI4FFv9i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/dWUVB6giq1mTGVXjc4zDS2ryybdwK13i41kqNRfzQoWz38MIhKXSbtp1qMrFEPrvWkNlgJEAr1DlKn1Qx+7/IJgXCScseotUV+UV0ZUuT6IuntBAx0xVbPxbXZ0R9HaDj47oarGRiSvHW13qsoODq34LqrAU1xKQsjCAIW7Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fe7U63zm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVEMLv+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fe7U63zm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVEMLv+P"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICLC0n1890449
	for <spacemit@lists.linux.dev>; Mon, 18 May 2026 18:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9aPkfTUHaJq8jAZbP1lkuOqQeGCaA06/tOgxE5JXc4=; b=Fe7U63zmYXSVX3BN
	CKLAm3y4bEEuL8aOQ8T9AqrR5zrWlNA2Ji1FXWksJeQ/5mZEtlL/og/7A1WApcBB
	1MYel5qXI3PqPCQ1TOfdmNRakU6BfB/+2bWzIKvh6SvQQylm2H5eWNvgajTbGwfZ
	4qAyu/iUSSuyd/P0FENTrkLJ/g9izODzacYQztRAnW9z95ir44F60uS7wIBECdjO
	W7TOGS1RS+GLxAFkcuhgoLdH+rBCP33UoDOWjh82AL9Ra088JMFi2+cVOj5r/hDn
	w6ERWrmWuu6cUfFsAWi1m/OlJQJ7/jrzu1UxeUgBVTstu7KBl6NSXT3kupxOSGPm
	zonlAA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw1g6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Mon, 18 May 2026 18:45:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3c7b989so54528991cf.0
        for <spacemit@lists.linux.dev>; Mon, 18 May 2026 11:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779129956; x=1779734756; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C9aPkfTUHaJq8jAZbP1lkuOqQeGCaA06/tOgxE5JXc4=;
        b=aVEMLv+P7TAdegVZ86Kw9CiKB6t3nao94z7BewOWYkSiIdmhq4wqhtpVOvSMIORwhp
         GvWpcuyyjk+0CpkVRihopTvXdtCwI9c6buJkt1XXqR4vL/Gqtr1k2c0KbLXqc03Y2KIf
         2xTvX65iFTyj5qSJMnZWzm8AY+cMy1lvnfqiOSufqK+pmo0JxRtePrHq3gScKCmP1ORg
         aD0fUWxz4TgYtb+BBgLG1Jzgewb4xo1AgtOYXidugkNr4nfxR5ZMfVVvMR4UbDWQDEOW
         Hii42mE6CI1SpyL54hgUdTTe3y/56DfhPK/psW6BivB2AFs5bh7NDl0itoUBI9xrjS3K
         KzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129956; x=1779734756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9aPkfTUHaJq8jAZbP1lkuOqQeGCaA06/tOgxE5JXc4=;
        b=SwcQANbG40rQfQdBitXmJ5F9ed9BBd1eIn7diZP+7VhSsgH+JKBBJRGPAhYLdO083E
         v22w07zeGCGXZ7zNVy0E6a55Cx3NkHIN4zsGWGVpFQgRV9n9Y+hylTxEpV0u2beZTAhL
         vkShhyxlolEBKdzjOaMRj4gO1HSOktcRif/CRSsGGumsjsPqjBYrDcojCw2bqRejjhFp
         DsUIkrePeS883W4t523dOT7qNgdKUSeIUpj10hIN51VHq6bE6CKw1v5owVJ/OyiiHple
         Jb5E3psOvAIqoxnEDByu1366KgweEvNcpqAWBDLt1pjbNvrJAfFEVRQEB+93JITgWw03
         yoMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2l5Dca0UZSEchFM7xVsPwX4xUSBIRT5EBTzKzXoC+sRlGlythJo9DJxMgbuFDvEDzQOUvlIZZVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWNMU2CFGSaFoey/FatOvpy0cv+anGgRd28ezU5VUzQ68BNFou
	vVIbt5U2r0FqaDcI0uE6CNidhxfmFzbq7UDwbGYo6Ll2IFTe0ExDno272msXYj66kdobSsSym/P
	bFHxa/tjSkK3x4yWMXRShDkttoITHd8wQHUSQUB7280rbyeJsalMLldZcqnT9zg==
X-Gm-Gg: Acq92OFWZV5cn/FkZQIbqE05j0wC0dGmsdqxBllkRBJIBO7tjvcB5QTvfxcqz+r7C9G
	HGbfwXOhZuXDH2HowYthjd9KLtWhGmH2AMLLhr1ZuTnQ+dBa1rnOsUDKhFxItkn3HbUTqWtUEdp
	XoCBG3I+7QcLQztdoXzo/RbkCD0ZtXS7RIV9EIAjznmkKfdiJ8uW0uVD26EpApdILchLTq1lM7a
	YYlndyBVq6KxtE23iBUJuJ4xiFrhEJJHAtW8Qdae9TJSOGUDHOHPv+HpedXHMI4fyXhCXYZ0s8p
	8e/IkPGiws5ejdXrCMJtlM9a293OR2qY0UhY92V5a/aIUONEpqtswOb9tFer+d1g/yrfQWDz/Xb
	Mlc1zriZB8ljy6GvaDkGAq0yU+9CmC09cS1qebS1ghh30qUK9hnjCP+2Wu8fcUIRu2nFyWcL5Kg
	Xw3zpMR2S94FLOIKtYfE4=
X-Received: by 2002:a05:622a:2606:b0:516:4f3f:d742 with SMTP id d75a77b69052e-5165a01ed93mr213777791cf.13.1779129956026;
        Mon, 18 May 2026 11:45:56 -0700 (PDT)
X-Received: by 2002:a05:622a:2606:b0:516:4f3f:d742 with SMTP id d75a77b69052e-5165a01ed93mr213777371cf.13.1779129955548;
        Mon, 18 May 2026 11:45:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9? ([2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab6aasm292775575e9.2.2026.05.18.11.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 11:45:54 -0700 (PDT)
Message-ID: <fc43b4b6-36c4-4169-ba2f-3453657b40c8@oss.qualcomm.com>
Date: Mon, 18 May 2026 20:45:53 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
To: Shuwei Wu <shuwei.wu@mailbox.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Anand Moon <linux.amoon@gmail.com>,
        Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yao Zi <me@ziyao.cc>,
        Vincent Legoll <legoll@online.fr>, Gong Shuai <gsh517025@gmail.com>
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0b5e65 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=GYkd94GAhdMpQ88-WtQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4NSBTYWx0ZWRfX4sASzc9D/IQ+
 52oQxz3/XCBO+lQkrUTzl373HU+jF5WonedJ0wj0clntud/WjbAM2bEx/lpAIZs8RSj00SVncjN
 dEvjCziIw7vBPXRe5hD0S3wh0Aw2JUAt1rr9/hJiZzXoNmudAbmoOfFYcCkOEEMvpv6Z4kPTb9s
 Kkdckl2k0lXHfnrGvXsCeKjBUjQLV15wS9vlLQROgFiBnYMYeMeeysxW4RULAsFrREKSUscEpo3
 xpudn0vw2iSRgIOxu0uNHRvcx+CC/x5KJNouOp1iV84yrP94degVyjF3ZA6TyaacxNmq+TecsUr
 bDLS6Dq5Rdeh7oR0sKYI/crDIV0cjVlXW36+0xLA//RJkvI0FeGBJBp+fbnFX6NudgeUTezIyvk
 MWBEKvSwQxeK4FziGj2QCnZLTJuxaxQ9gE7dB9ysLaFKeCQOtQ74zFMYmYbKKszUFbN3GyKLT/i
 t6JS71/SJltNo8aSQ1Q==
X-Proofpoint-GUID: Lex__Um92q68kWvbCS0Ron2odbCLHRWX
X-Proofpoint-ORIG-GUID: Lex__Um92q68kWvbCS0Ron2odbCLHRWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180185

On 4/27/26 09:15, Shuwei Wu wrote:
> Introduce support for the on-die thermal sensor found
> on the SpacemiT K1 SoC.
> 
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
> 
> ---

Applied patch 1 & 2

Thanks
