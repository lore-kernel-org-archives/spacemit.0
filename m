Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB1D261B70
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919727; cv=none; b=TQ1lbVN/0wtcT6/C47gyPsK5QlW4UGJvcopaFC88ORV0V5gOeCCZz26Ibk8hh9tORS5SAENbXW0TeYKl7umaICIdImoPZuuVszl0IuY4VS5e3ohCa6tng8BpeS6a6mcGXSARL7Qg4k1mv+iwIhaPgDbNC+USqaxy64ua3hClE2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919727; c=relaxed/simple;
	bh=oswZl/DGMs8eoEd/aGuPv1AWlVCGLCN6LemdERuojdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAnTOKNeNRexHtB4qma+3NZZFLI/Y8FIB6kfvoYEMwMhfU2dRGtpx6YElXHuG3XQjD5+eBWy8Z4R/PJ0B05xxouxcjWrZIwow+xzpLAzHr4f2Y90HiQeKz83dwUazUoBGlhtG2iNxfiMedJAlh0F7RmJbhtOzfk5zndDEAabPbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwzBRPFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTz1tmTk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwzBRPFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTz1tmTk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D3A52K299005
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 05:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9xVYkyXqvuSpTs2QWTynmVppBnWKhiGOrHMenH7w7o=; b=lwzBRPFAavnedYb6
	s77F6xL0sxpG3lTWIK8NYWpaB9e399GNLmbLBOB+bI46HOHjBBBwdPsx7c+h1h5d
	p1CSaP8y+9BACrRYDBWL5TUi+Voh2DAvvr0eENWBN+EW+eeuBZNgMVbfZVnVejAE
	iXU5eIWuxMq6JE8zVWp1A/lTb82Xj4eRDGuCr9WbCfsVQthOseChzUe90BFMfhE9
	c6zgE5UNA25p0BmmIC+wGik43OavoPT0Ou19TT7AQrOD6Du7CiRu8YOAseuzOHBW
	+vq4myZAb9ylwOTklPztbNRmeMks6jhGbV9I+kJR9H7JJ7SYTUSO7YUHFfs5l5xq
	2pdnqA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn38vdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 05:15:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1869124a12.1
        for <spacemit@lists.linux.dev>; Sun, 12 Jul 2026 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783919724; x=1784524524; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9xVYkyXqvuSpTs2QWTynmVppBnWKhiGOrHMenH7w7o=;
        b=PTz1tmTkLBN2dJNFZOV7RA4AGZhqwudU8ooOww3r4kkFHo7BoUUbNWlTXTyuoBIryN
         6bdTT5fMUdfX8hCMDobcztOqjuThkl1MvBcFR8lDYs8N31LVzsF9+EaskAeuv4pmXT/U
         9/8jWweAlRUVDEmP+wXlbQY/w8C0vpFJoJzL8IDecioG/BHyBZ+771ro8+ocIuFpP+U9
         FiZ7/WSFk9O+oeO1xVzTzF0GnYb3YTkV1C+1qUXhaNbdHft5FvIVur9cx6qtSILhf59K
         6E6mlewHJhC7HlFl86tVufZUj02VxGq+I2U4/wgzVlnNQxyaJEaJs62ns/IhBd1Tfwrl
         EAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783919724; x=1784524524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9xVYkyXqvuSpTs2QWTynmVppBnWKhiGOrHMenH7w7o=;
        b=eLEOmj0kpJUE4ly10a/JsynbwX1DqiPz7rZfd3ji0cjmevqOU4xpSIqsKRXDacNyvr
         g9YywrYg8dEYPeWRxTqcQjANS6wgNhze5mG1xcQeNm2gvk8c5/90PVgz2oI5Yhr/GTpO
         B74ObON/WQ320c2qegI2dFiwLTha3idSOsz5yegbBA3/WsJh+MsFsRFxmVLCMFwvz6SW
         hgnmFirMRK+a5XY7PH8aYS+WTUKDHvrhEAQN8lQZksfuyejx2GK/yRzQ7wnd6V+kAbIY
         TDd7oM5wJ4Me5eezHu+1LvaaVDVWfm6Xv4Ojul4G3Z3fxrOEYR+Q55nW6+jIl3gSqP67
         IKBA==
X-Forwarded-Encrypted: i=1; AHgh+RqFtfim10kR4Kq7Gl6bO/xS90gYCU7ZqnCjaNkk2zeMalZxDrB18/+lZWkAxKHjBE3/P0lhNme91Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeG+HTdHxMhxasFTE8FlrkU5rv6JN1o8POTBdtytoWUjQxdMcD
	X4QdjAODJFZhjd4zxkm/7dqIBR4Uu+7BU8xJNeqB4WT/MNr8C7Phkc6Vl/wVgqitbJcTTK4it/b
	p8q71Y1cU+z9bmRq+zUpZiOTyBW/0J5oZW71M8pZMyfDgJmh3N8vPaAwYpOXo0+wXiAAojQ==
X-Gm-Gg: AfdE7cmoDjbqPo4BmpL515FT7QzvHa61OJi7vQilNH6abToxWPSRVCzK9tbMI2oI4Nv
	BQiM2FApEjMB81Zc3PkMD9bnQdyyyVjB1bJu1ZTFe2YctYWrR0vq6GE2yyuHytwtiZpAc/jC7WZ
	TcodZruPvdW4kD9ZZ6WdVev69yIQEu7/i2uHhCAnmOzjHInifcillj+V2Rkygq8oknkj4dDgOs2
	Htsm1yFnE82zdEP/jxAQyX1xFbQ/5O+jHkodMYWER9zHXGgenEWt2htPOYQ89Kkh/Rdj1YlfMWn
	LUTg0wqMRTsXm3AxA3khJwiqUJm+/gzstoriqBZx5pr9cF+sR+IOBRHzP/aDF2YLLCP8bevZvZl
	u52GVLwHRK4dM3m4n1LqSpKO5xsp59N7X49Koyde1AY54
X-Received: by 2002:a05:6a21:e8c:b0:3c0:9c19:6598 with SMTP id adf61e73a8af0-3c110b78efdmr7269818637.64.1783919723742;
        Sun, 12 Jul 2026 22:15:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8c:b0:3c0:9c19:6598 with SMTP id adf61e73a8af0-3c110b78efdmr7269799637.64.1783919723302;
        Sun, 12 Jul 2026 22:15:23 -0700 (PDT)
Received: from [10.92.175.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b8fc7c088sm17904482c88.2.2026.07.12.22.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 22:15:21 -0700 (PDT)
Message-ID: <27a69fe9-7822-417d-8e62-056cdd2ad9fd@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:45:17 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn>
 <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
 <76c5567a-cc93-422c-a18f-a32dcb101428@oss.qualcomm.com>
 <d047f823-feff-414c-b1b4-54f6ccea6b66@kylinos.cn>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <d047f823-feff-414c-b1b4-54f6ccea6b66@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfX5YX17WcgCRZw
 EuK9IQW34LMlTUWYoRJ1piNj3ZMG+3pjUwcJGiXMgkO4mySxjrx15aR/uDQSQ3/CPT7+aEALdvy
 FWC1wksolrIOaT01JWbRv/qmLWaRJSz2XBekuzcVx8uRVR3K9qeSuJgRZBdbcFKGCkZ96LnohWr
 NNrXBEEO/rDd3lvcxXwGZ4RALGxMNRg1TNKm81bFugF9A5w+pBNUDADd4/LYj+I4fL3KwUHKOnE
 PB9Hizm4Q7O+9BHwtCmW3swNiE9QDybSjC9QKPo8NtcyBxzkjqC6+iDjA4i5lDduYR5zL3XwObk
 xWMcR5xj5bCwvCXlH55rm/5V/TKOioOrSuq7xRyjVJPyTE5tQ5iQGd0kdjrcWcni7IeV2S2iAu2
 5WeRjzrWcYoQM+H0ATrIE1CQYz9Hk9xquzLAxO70G4UYbvZb2c1dwO+EmvrYhYn5SMXY4bcy/ez
 jnCzu05KlGWE/5Ii/9A==
X-Proofpoint-ORIG-GUID: TqwKSNT_096eAma-Ca8V7snktZWgcUjQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA1MSBTYWx0ZWRfX1/JPJX9PU4Zl
 Sx30iNYMAZ7aE4KBApmXu0Bf82qDSHe4jiUvZoH1wckiOJ/4fuXAXJ/OHvOyG3lteImUU2sgpsV
 10WQf2Dn2OpV9tN6yYChjpXqCMgdEn4=
X-Proofpoint-GUID: TqwKSNT_096eAma-Ca8V7snktZWgcUjQ
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54746c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=_3TyFvm4RMDdthPgtvQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130051



On 7/10/2026 2:58 PM, Pei Xiao wrote:
> 
> 
> 在 2026/7/10 16:50, Mukesh Savaliya 写道:
>>
>>
>> On 7/10/2026 12:51 PM, Pei Xiao wrote:
>>> When the interrupt status register reads zero, the handler should
>>> return IRQ_NONE instead of IRQ_HANDLED. What the return value
>>> actually feeds into is the spurious interrupt accounting in
>>> note_interrupt(): falsely claiming IRQ_HANDLED defeats the "irq XX:
>> note_interrupt() ? You mean to say No interrupt OR invalid interrupt
>> here ? I could not understand function name.
> https://elixir.bootlin.com/linux/v7.2-rc1/source/kernel/irq/spurious.c#L222
Thanks a lot ! I understood now.
>
  [...]

>>>
>>> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
>>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>>> ---
>>> changlog in v2:
>>> modify gitlog for Modify the incorrect Git commit message to match
>>> the reason for the modification.
>>> ---

Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

