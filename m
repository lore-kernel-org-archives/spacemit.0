Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C4397E85
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673421; cv=none; b=MbsjFFegrYp6BJt52MUFtNpoT+GpByj0TFX5NuXSXxUMhE8+kq6SRTYJzhPccv94CbsHYBZCZPyoo/mGRZf3tTZ4d4CJUfO3aJCJAoJjEB6182mshhAqLriSODAGhyi09uqI24p3Ny8p8Y9oj0yhKf1m7hxSCGeZ1U12j/WY8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673421; c=relaxed/simple;
	bh=9bWhbND8DyvzDCbaHug3rOhbSdj9QX9W+6SjaKd08CE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZxMYscAGfEvKMWWtmEtLTI5iZJxiKL49EXcf6vUx+0kDAaj44PJY705wMwK8mR9uGvcqAtfxY6OgvTZoxZeTz5rRsgB3xeF4ai8J/dSXQKSiOI2rjvd0Dan0qYcBqKvoFWXbB8xAISHzmyaChZwAKDZSkD5Oe5nVq0miyFJl04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xg42b0g9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCpH1or/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xg42b0g9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCpH1or/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dYkm056509
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 08:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0vPVQ1ErU/pGixkPNw1WBsE9kjQFwY0ce2USBSASEqE=; b=Xg42b0g9MUSCQ9s9
	qurkfwSTMG6N35ozQPKaN5u+nbzys08f8XsFv4NIhisNMtn7IcSV0gUsuyb1v13A
	/gtHNuvVFUSE50JwppjGYTR0czD3xR0F3WnsuT64VgQvZUahdJNCf14Q39IJLLBm
	htVWmPmThcCn302tmihCRcdtCYhyl8q244e4BBMfDw78RwVgyOB/HH4/Qw7HmelH
	LVtzEIAzW8OgqQxMOGXsQyH8dzdGQJh5ocqJMvg2od/JmyA+H0o24kFPgau22FYd
	h9lp10hZTxXxxPEgOwj8sDJmK3+TZlRzdZdDZGmqqhsyTUyh8CG+hFZcgv1hj+Q+
	coGAWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwta71n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 08:50:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso18191515ad.0
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673418; x=1784278218; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0vPVQ1ErU/pGixkPNw1WBsE9kjQFwY0ce2USBSASEqE=;
        b=NCpH1or/d6PDe/4kD/ktB81TLkYivu6WNOidnNS+cxvFw+fFENfd9snN99AsLgwK+z
         1icZi8h87RzhKsRq+mvioWsjZTbJms3plL7RrVGsEZWsz4kl4fbbY6B/SxvAEjyr5aKy
         G8+2DGzu15A2flTONlZMZtBIo8XrwH8bodHTQ8weEJ3rClbDciuQNZiy2h8FefAPgTZu
         kOWYeetykRsEq/FKgIOgDb9srooIKzL5VR7gQck8u237/7WkOUihrEeq/GLz0e4E2R9C
         Wmn7rT3dqare0geNOHMHm8cdZ8MpNRBArYR+NCmrzcYqq69gLywMne68o6x7/7AdSrN8
         OrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673418; x=1784278218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vPVQ1ErU/pGixkPNw1WBsE9kjQFwY0ce2USBSASEqE=;
        b=Bdo/30UCZXSjFRVId2xCmEXbQim0LlAHx4bZIkvfeeJXEle6+Zn4rBurwnHTrQkMml
         hb8Z9uWom3D8tY1NOW3F9+bLn2Gc5pO/MutDTWJIQ5HT3NVCMyxdAut3Qhm5jaArAZmT
         2dy4v/eYKStMYEeICzI+W8fnRzaIUlamR59dL/7on4Q+/M7aPnlgQtniif/qO0RhFLxF
         qTfUff8IGhg5zTF91W7/VWTc8j18Pxz3qJEVGRqHzDGejb/kOP1cDUZgN7FVpmaw52CF
         r4KdCLZn3nyoMFFsu9uE1mPJ5JpCRAVUnbXHRFqlo/zGG7JFDrHt809VocIdwaEielo/
         LdKw==
X-Forwarded-Encrypted: i=1; AHgh+RoW/1uSaWRQ5QQmxPZWWk9YXxTg1+7Pr2yT3pbok8fIvm2Un+JTeNDofWOePTD9jJ/7VHjBUOsxgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTR6qK/GJWIDMDuw2PbxKQ11ZrHbfxKi+iyw4WwZMAqIK3fcSq
	+vuXfLEkKx4/Xhlc4NtbcKK/dx/F3StXmjH0imk052jPvNG4tuPJBe+OP7c+bXnZhZprkv33YQM
	Jc+iqjtoAnFVEZPE2TnSmKatKLedhfOqONbx9ZX4zG3kMwNiHE/yQ09bcZDgB9A==
X-Gm-Gg: AfdE7cka9uUKE/yvpYJSGcS40JotSY4R8MjboIVSNHMv1cKH3jpmi6TdeC/93NF5VfB
	JM+xkRvwfJDRYnRaCypukqRwplb6oWdb6ur6FdxTItUeLH2pjcW9ONe9AYlVs3MBHsze8udsnfC
	0mAYzhjkqUPfBUt5YYRCPytfR9eOHmclLXbeo9QDweSpxBF9rSqwtvzZ1g/DVIyg5Ye5BFnjChH
	2jn+GAKcc4GxzpsHzPLuY2+JKMgnZSi03PQSEstePMMrEG+Db+9OR7Az7CQzZ9qirHT2zc8QVOD
	uqWrhmXG1RHk1BhiGMFPotss8flbIvdevDTMPN494qg88wk0gq1+1Htujc/ccwkze0aJdTbYWGg
	o3YKwTbBWPSvG0tlijakxAi2RZTwDv/15dpfkH2e8Ad6v
X-Received: by 2002:a05:6a21:6115:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c0f0b6fda4mr3080657637.26.1783673418510;
        Fri, 10 Jul 2026 01:50:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:6115:b0:3bf:aa54:4cbc with SMTP id adf61e73a8af0-3c0f0b6fda4mr3080616637.26.1783673418002;
        Fri, 10 Jul 2026 01:50:18 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c76dsm38642648c88.3.2026.07.10.01.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:50:17 -0700 (PDT)
Message-ID: <76c5567a-cc93-422c-a18f-a32dcb101428@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:20:11 +0530
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
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a50b24b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=fdZnArvSVwIb3KS3I78A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: huHwyudh2ZTM61ip_rrM_b5p8VG8rHRS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NSBTYWx0ZWRfX3/M4ZKvYqpP5
 u473v/E1HZN6JqUnUpjveSgCyV5hSfqEJmBe8h2d+qnVnBYg7nZWgYL7lYk0dFiudw3tEVnxSTC
 Hl+dej6Ncvj0xtsRLEvw5v69n/IOvHU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NSBTYWx0ZWRfX4+NgUf7SIiHs
 h9PfYZx7aL1HKO6YD39/DT+kOPb8A0A7cNlpEv3VM484lxMP1INPrRI6a6vxqL3tBXBcAjjxQTi
 twfaUmRS5+NFZkQnkUPxzGsbevPE41hQAmZVlFUnh63VeIsidm0DVnT/jgD2wM8cRGVse17aUaR
 AlooBxG2A9fgolaOw4C4IOe+S7D9OFh6Tiax0jYbiUfQIYCYSiDUmKYlfQlTRiUf2bRHiibVzjl
 5NOlYps+j2/GwR4MYyvNS1clLKnwVAzBWgFAnUAfTFypHOI1qR0z6iXExPD+pBe21Eth6AkY+33
 WI+yPiDSo25zaA3RXc9/ODP7h/5jfnWzr3gs9Zt3jFKX7iovwMCiD1lcY1wa6eKwgIkbmLgAu2k
 2EGs43S86c6vzPgZ6aQ9IOQIl1dhsgc5lWclaNvt3CC3qju+YehDZWkx/h0sJ0gQFIV/shsqXKF
 u2DIhnSXYUYJoAvQABA==
X-Proofpoint-ORIG-GUID: huHwyudh2ZTM61ip_rrM_b5p8VG8rHRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100085



On 7/10/2026 12:51 PM, Pei Xiao wrote:
> When the interrupt status register reads zero, the handler should
> return IRQ_NONE instead of IRQ_HANDLED. What the return value
> actually feeds into is the spurious interrupt accounting in
> note_interrupt(): falsely claiming IRQ_HANDLED defeats the "irq XX:
note_interrupt() ? You mean to say No interrupt OR invalid interrupt 
here ? I could not understand function name.
> nobody cared" detection, so a stuck interrupt source would never be
> caught.
> 
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
> changlog in v2:
> modify gitlog for Modify the incorrect Git commit message to match the reason for the modification.
> ---
>   drivers/i2c/busses/i2c-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index c2d090f6ba80..487f23fde725 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -728,7 +728,7 @@ static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   
>   	status = readl(i2c->base + SPACEMIT_ISR);
>   	if (!status)
> -		return IRQ_HANDLED;
> +		return IRQ_NONE;
>   
>   	i2c->status = status;
>   

