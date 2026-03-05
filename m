Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18960377575
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702115; cv=none; b=Tws8YmkmRjZAkdfcXDgA/DyWMSeJn8D1RpHURbEE4DReAlgZePNubdFLbu0qB8CuihlVko86zGcTrl44tSlGle1OCpSy7qMVD4xACD0UAK7mVn00BcSeCIYTI06624V89WkJLQyQJBaxjzW3WaC10nt9ZZ+zwjNLOSbZfLGASqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702115; c=relaxed/simple;
	bh=XRZpedr+2qpOkN3fG8Q8Osa6UFaMF5goxsvzLuitC0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWonXAt0o5WutQ/VbCizpMqy7sddtC4U41NXky8oFU9uaUOP85OxjwcIdEiC/NheRgWDp/ucUE8ycp3aKOz9mI/bFMTaDd4WY6zlLM49fpyzeHB9+DIhHVskjSeWJJ3QXGI+m3dppRWvteHovwDZs2ob3QWWKfygcPgIiJkcm4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQRkPmX+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsFogp4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQRkPmX+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsFogp4u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258hEok629141
	for <spacemit@lists.linux.dev>; Thu, 5 Mar 2026 09:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=; b=fQRkPmX+D74BHrMb
	asyUwF1awRSU41+Alv6Wnw7Gs81vmURRSipvQe26gecP5AjxUQs2FjH2evlpCBle
	EvlJTGeq7/hZa7TgbL/eiwIfLm9VDQ84HkWp0PDa9k8zC3mFxWdX2oUrXIvDSeUO
	MJlRb3hfiqoNxb4lqLQBC5yk39pNljrdNKN9SvZotseq/6rNLYILsr5slIzaGT2r
	CXRqeu0rHZQRIblzagGnKAQ//HjjGknA7AXeqY14HW8GLv/JQd3X9Okrf7xmxJF5
	2NdQ/R4sUdq3+kMqXrOnJ6N/9Kl6X1z8XshPF4tixarfRUFzzIjQtTlkBNy1zXbb
	lHd6eg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m2nvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 09:15:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a012f8ab7so25540596d6.2
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 01:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702112; x=1773306912; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=;
        b=gsFogp4uD8QWtyWpr9+0ydIrr/qN1naCduCFEBa+OfvFeFQc31d9JmuhYJ1qOPyrOp
         j73Y5fvD3AMAOZ3W5H85Mfd7i0JJao7736tkHoPNRUH+h2XG3e240dByKoni1jHWm4ZJ
         328tHu2UVuAAep9XkNKA4AZZArXKcVzBb2RakoDKW84zDpQM24HmI5tkl9ZbJLD5C1Zg
         CTBS6koiBG+vzW3cE8OL8l9zArs2/O4rsfWBK1AiOBxGThoSBj8AH0PlPkcUa0OPBuZf
         b5cLEPkXhoppaLscuEweio56ssTrPTiW9zdvIZlS3ju++AI3I0GMtOMigO5Lc7DhjmYB
         OV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702112; x=1773306912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lB2MyXzqwL2fKx+Ie3b2ww9IDsTWQhJEMy9qeDpkHuo=;
        b=jkZHgR8YzSeMEcfuvwoPbFdlQXh8e02CIO5lC0HOQWvi8VWSatEIGPhu0NM/g7Gdhh
         qLPwHmKrGSZKDMMZJucI5i/AtshuKeBkqP5/z6LBcg0X3GXl9EvDB/4oShW33fFrJkXv
         uQWMjSvY2+/+/vTNETr8p1yQcwyHaf0gcY+YyiNCp+7c/PoV/ZttgYoaigWs+Z6gDhCx
         OtnHyKJ/UU2siHiH1qX41z46cGecmEX5wjPnrCQrRv5JBSaZ/GFhhocUSlV4aVOKqmzC
         7/mGrUkIedAcqU0EWo2SH0Nmil+dkz2bEZd/PPZrUG5HeocZVw1QUx7U6zQL+xGWUud8
         9kAA==
X-Forwarded-Encrypted: i=1; AJvYcCWD5BVl8Oq1naebBtjwNXdvK3LRI9Z73Lq/Kk13PdZ+SkCUemUu50bjXLvgFeEyAr6QkmSO4pv1lw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6N2iu6r52cT1gluLKUDtTj1GOhFZQgEYkmYtaL0lilo9zK0BU
	zk8CQZLLJnca/s8DbdqZHu4Alw48piufRBnrhKzDgNzlUPkhrhA0Hgv7I1ra+ab6FwUBvaf0PDv
	W5wXItxB8lMj3fyEstNtmHbxPXVapyBXqxf1XHlJUMobotM1K6s0e6iDPIb71Fw==
X-Gm-Gg: ATEYQzytRgmYYRh187o5TGDbeKbEZHYumJ4eZl4czTIHDdC2nGSRYyA9G85C/LBBrFv
	TTJtrnKCfpFguQSQZ5XGp5y5LvQNoPpXlOOW/egu3Tqv9PN/DRwIcmf/mM0CyVpSI0rncFl0CVx
	vC/vkDTbtEtPcajuDybgsawqgVFPAJ3L6S2I1P0DATT4ggkTmKsoj5k3CCHw+uFchSpk1KpLFVE
	hs/nZ2VSRhfV2L+WWqV/m1jjS34FSKc/8MApJXOIRiMvVYqTrVYuz2RVDwbutdclG4PoTrDHOod
	C2to1QrxNybybz1X1r+TK4zsXLEIhFCqofhTWnvIfwBCQYVodu+nBSn3c8uSxntGkY8Rq02NyJa
	joYrpLmML4dBW0u0A/bLio0hbkxXvI7k6+3MpSw7sZHOrOsSsDP47u/ca9GtcwLNjoAkOQm8BA2
	WBYxw=
X-Received: by 2002:a05:6214:4842:b0:89a:1720:4c5f with SMTP id 6a1803df08f44-89a19aefda8mr48644726d6.3.1772702112246;
        Thu, 05 Mar 2026 01:15:12 -0800 (PST)
X-Received: by 2002:a05:6214:4842:b0:89a:1720:4c5f with SMTP id 6a1803df08f44-89a19aefda8mr48644286d6.3.1772702111839;
        Thu, 05 Mar 2026 01:15:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666eesm878784966b.35.2026.03.05.01.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:15:10 -0800 (PST)
Message-ID: <19c70059-ee24-4b16-8df2-d5c9274ac6c4@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:15:07 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <ebee2fcf-9069-4a9f-ae72-86f4471cd4f3@oss.qualcomm.com>
 <20260305091336.ls3k24ieehntxf4f@skbuf>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305091336.ls3k24ieehntxf4f@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a949a1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6df94im0sWgtjZpQi0gA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: gvKKtyGuzbvq1QrDyVZhCP9c4dRDMVo-
X-Proofpoint-GUID: gvKKtyGuzbvq1QrDyVZhCP9c4dRDMVo-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfX+dbNqwll0P12
 tilUDsy1yVYxapTigy0NZmbjKeHZpVPSSNVFnEGE8wWgdmzp7dNcUvbfLUdXO4A1cPQsa73sE0u
 c10Uviu0xMZwWP4IG5crTPcaUFPlj6TgwO2vQ26K0SfF+CkhNtbjoIEbxdAKF240H2jmFF+89BK
 vC6axNC3ODtlSbvVS2UC7Y2V9LXAtaIYd+vUjkM6tLudnG4afZJ2EKEon68eJ4tHBTp+sujz/uq
 mWOL5gTMwS7ZmrSgqa/R1g9JVlcPCHXL1juyBfPyyhyKK5UJs/aq5i9DyzK4f3qQ1mRXMD48Cyv
 lZg2aObyOkCeYTjXFSo7uovf/A3Sq0pILMZIuICJLJtOxUgpDKg+YiQj2REoB8sOyTTy1DFbLYD
 rA0veRmx7a2gE4Z8/wNIupyiuxpEFDohaZe2eCemHWJFoYZQvivfcEMsAV3JffviLIDUO9xDitu
 71nrd1J2stjPMnUaMjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073

On 3/5/26 10:13 AM, Vladimir Oltean wrote:
> On Thu, Mar 05, 2026 at 10:11:32AM +0100, Konrad Dybcio wrote:
>> On 3/5/26 9:51 AM, Vladimir Oltean wrote:
>>> Hello Konrad,
>>>
>>> On Thu, Mar 05, 2026 at 09:39:35AM +0100, Konrad Dybcio wrote:
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 55af015174a5..bdfa47d9c774 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -10713,6 +10713,7 @@ F:    Documentation/devicetree/bindings/phy/
>>>>>  F:   drivers/phy/
>>>>>  F:   include/dt-bindings/phy/
>>>>>  F:   include/linux/phy/
>>>>> +K:   \b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h
>>>>
>>>> Would looking for the devm/of_phy_ prefix followed by an open parentheses
>>>> not suffice for the 'has function call' case, instead of listing all
>>>> currently present exported functions?
>>>
>>> This would maybe work when you run ./scripts/get_maintainer.pl on a file.
>>> But I would like it to have good coverage on individual patches too. And
>>> since the devm/of_phy prefix only matches when you "get" the PHY, not
>>> "use" it, my fear is we would still be missing out on the most important
>>> part of the patches.
>>
>> But that's just '(devm_)?(of_)?phy_[a-z]+\(|includes.h'?
> 
> Yeah, but what about the networking PHY API, phy_start(), phy_connect(),
> phy_inband_caps() etc?

OK I wasn't aware of that poor namespacing..

Konrad
