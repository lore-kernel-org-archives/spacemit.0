Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488106;
	b=ZVXtdH8nRf6nolFx04pvCA/r8yMjiyyvg/PqZNBRunHNu/M01etvcg2CXwgahS0YoYfB
	 KASaMWBpgzbJkReQn4F4nOTBjyr05rjxvXPTmlJ6zgvnq8b/NY37IpsGBtE1r7UNXYUlO
	 DTRz6OLpLlGme1Xdht8F8/ExCLaa0y+m/8RS4lJgV5QdmBSzcA30Lx1I2JCrlYH8mc7NP
	 Wdqeg7FItdcRairclfSSLzIVmi5HepVkktZhH76lIlFhYOx12FMtnQMdepc93jXH5Y6UF
	 abwtHQoK83HJgAY6pzH4DA/VpgJZ6rO0QPODQXgYsguYQfNfS6kOQyWEcC/vprgqOkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
	b=GbbipEMj5ce6ZRUrqKdaF5rjGjZz/jnNUNLSf6QYipYOJ0pLAuBWLwf/rDz6oNlHykOJ
	 tz7TPktHDGx/x+CYLKCn9JastmeVFRSFfdO0TkTjyDLH6qcgvtmoLulTOj11HUj6llfI0
	 3ylnnpwKuPXGVk7ZpXOtMfPcZUlWZ0GOxRhE/flJ6a6kajuTDRpbbPteiKGR5KrPauUoo
	 b1Pz80h+6Upt35cV3ZwsoPqJ5ZXEDZKZkAqrzblmG4qnQqbraHKnPiADe6dT6WKMVeNbt
	 TnzsjPmwTvD49fK0aa6aTEGMGuKKfH+QFb2yRHjWmmT8zhNBJbUkoTHM+VbnE5NflcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mpz5ENUg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1HBovCe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0939606A327
	for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 12:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0939606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mpz5ENUg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1HBovCe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9CU754092378
	for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 12:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=; b=Mpz5ENUgcqRabHUP
	PD3J3yeBOVQuO3lto59EUpQ+arQ2gq2AwvPOsTfYA95ODC3Rd2VWtXnNMSumVmxn
	IX7m2D4pTpCsNVLNR6W+VCpIfjV5z02Ym5UXkWfYDRbj0W3lmSde+LMcM/Y03e3J
	pT3c5m/VovkQTPynUrjPx12qtGwROyoAbSXISgQC62QVKXPDyK95qTCf2JLdji07
	G6XQGZWPa+cs0PVEDzxhTuHVELhXyASTkjc036K/YUv4UBbKkRAsWHD02P9D1rCY
	7OgLvVZe12vQOHcS6cQaLqmZ/VomqPit472dY/vnqmfJ4jE9DbqRmpCw+0V28/XS
	XdG5Eg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jvw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 12:55:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so2566783a12.3
        for <spacemit@lists.linux.dev>; Thu, 12 Nov 2026 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794488104; x=1795092904; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
        b=V1HBovCeAXT3LZzV/JAWRjEF/iF2Gmc2dY2lCRxqoSbMbHQSC2lliI21OZUmFLOj22
         44oO+jEc4rcvWlGIivCQl/oR/F4XZ/o2vIW3V38xV3tz4K/IV4nS4E+08zMdC6LFpPiv
         fBOTVuDrCY+Yq/wMOpgC+GoYKUMAwROSW+rFYXXj+DAWVYmYCUSvNtQUrTfCCozzhHFa
         R0q5fElXqKkQTrIICJyak6yBpsvYZT/LHXwBBqWI5oyx01bl8dOL5Jlo6FaXBFcBWr1I
         fD5Bv0QCEu2fNlRDNaSEGfNq2S3GCEwAwZ9DEBpsKmIlc/KvifTYGlV2diIe132gmceF
         yN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488104; x=1795092904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJWBGylPd+TUvS4fg6aAHxRIHS3fTwweS5Rmh/QZp8M=;
        b=Hkv6xT7joPM+FQtKwF9fhBAXmbC+yFxJmlfAscu8xZ+pMPp559wfRNpX6rkOkVAOB+
         fJTxD/bfxkQ3z64txpcGcDQFP8KIfjyQ8xbuDlTUs8dQMYXut7USfRm9zTE2wZvZKJJM
         0DOAX+ex/u2jJrqcbCiL8Yz8Zk8qWnzKBYseS0ud7M66Vjn6iZwT7DxcGcus/Sg0y5aY
         AC8RsQ7b4g2QHAtjKKo10q5E8DFawatEoP3dWlcVaQQ8X3beBmA7WO1hxxWH779+6MQV
         doqMGSl4sBv1eUEKv7UPGWhKAj095ItBWnAunJ6iTt6/Tt5vfzCMNx54WParsxVNCuem
         V4dQ==
X-Forwarded-Encrypted: i=1; AL+hErFv4zbP16ZVBXHIwTggDlwHdRGJT71/TqNVjuQT6w0KwocDPBNDTjOy8iAVn4Rv6M8OXFw5HF+VyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/+b1vpuZa3wx9sTSo3AZlIl+DYkgQSqtClAs+bS370LuJYY+j9
	A6Cgr+ZcJlD+Vl2peNkRcpbp2GVps9QWsub9r6u2RF/t9IXEiNfAbelHkaBolNJAZTKdqY5gEQl
	XRyBY4jWXXlvV3Hp67Zmjj8lDdc1TmWDYPKy5UyBkQbD10wwjtaNK+FElIi8Tjg==
X-Gm-Gg: AYBFou2u6G8yVPCT5xK0FwT5rQhk8qnAbqBtMcjfVPa1/7SZpN0pOHZJxPwRnIidcTY
	6q9cEc8KtnNWUaXTw121ZvhomYQlF+M4zRNqn7SEDj4eFoLydUmztcLvqKIs0H+m6dKLJFlm71+
	0CVKgJDtIP0BHv4CfiC/o+Roi3PDdFP3l23Ztw+v1gOb3YuWgY2N6G330zo3SLpSUX5b4xT2JE/
	WGccAb5a5Ue+38g8zapWwQLEDAL687ixKPnwFcoUuajABTqc1dVsTHy0NxUMv1FtqbUarLUQc0u
	PHLHfbzJ+B0fEGhvMt3BbRJ99jOkRUiSlkeKpEMOMm5KiMvXrTa8BfxIgRcxd1RVxgU01QBa8Pw
	/ym8pw4ervm5DF45kb8ycgIUo+jPWxyXYzEqRpvfmZRJNASFT4hN1YS3rHW6aRmBMsb6LPvE8+x
	MoUgfyEaDN7o0mlQVWv3jaexuxQdj8Z1nBDjcmygf8N911
X-Received: by 2002:a05:6a20:ef01:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f2ff7caf1cmr4970711637.61.1794488104079;
        Thu, 12 Nov 2026 04:55:04 -0800 (PST)
X-Received: by 2002:a05:6a20:ef01:b0:3e2:2fb7:844a with SMTP id adf61e73a8af0-3f2ff7caf1cmr4970682637.61.1794488103530;
        Thu, 12 Nov 2026 04:55:03 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa9631absm3493088b3a.28.2026.11.12.04.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 04:55:03 -0800 (PST)
Message-ID: <755d7440-28f1-4c9d-bcef-33beb25c71bf@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 20:54:57 +0800
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: dt: Set the initial OPP to apply its voltage
 constraints
To: Natanael Copa <ncopa@alpinelinux.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Milan_P_=2E_Stani=C4=87?= <mps@arvanta.net>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yixun Lan <dlan@kernel.org>,
        Troy Mitchell
 <troy.mitchell@linux.spacemit.com>,
        Shuwei Wu <shuwei.wu@mailbox.org>,
        Aurelien Jarno <aurelien@aurel32.net>, spacemit@lists.linux.dev,
        linux-riscv@lists.infradead.org, stable@vger.kernel.org,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261111130430.10359-1-ncopa@alpinelinux.org>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261111130430.10359-1-ncopa@alpinelinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXwdvC2VuFB9na
 wzDh8Zt902ElMlLp4K24T9BOSt+A4Wkf+x5cfZuZ2AmlvrDsf52F1jPLZvItv+5ei55hcUyt6cO
 CV/vm9Kk1EiyUgHckOxqSI6LAYFLMXs=
X-Proofpoint-GUID: _o4jENIWT1jVPNt7-TtT29dJkqh8TP9E
X-Proofpoint-ORIG-GUID: _o4jENIWT1jVPNt7-TtT29dJkqh8TP9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MSBTYWx0ZWRfXwP7APjZFcBzF
 QXReYB6uV5PBgEk0oXwxYOaWeRZsn9JFNdhQEsiwiz68du/xXHT6joEbGAtndv2CQZAonPsnlLo
 bBvr0QFCC1ThW1WGSvdyrondFyK44tg99HuO/gUgVUSYii26Zo+Pf8ZmY1bEszoU/Jkl230r1Mc
 HmqdKloo8RmRsG5oqSe02wUzlfulxStCUA++yq9iMRbz4FMir8cxU+LRdawLZunl9r4pj5g64RG
 J8aPLYQaLAqqZG/1T7gl0/i0zL2xBpQgSrzJwAsNDt2jRKDx8JU+2djrg6qFrSeZVCSYNXPiMQ2
 FGVy6XDw8o6FNnx06oLJsbe7sKoVwS4GNcLEHvntVj6QrhBY7mSv0G1h85jE7NlUlY+lqWoURPh
 38HuDNUDgwlFGQS9dLTtW/73J4DVi++Y1AUv8kUpHkElYQJBT9oMSCU8xdgHKSTTBjPesSfPQCo
 OMvBkvyiRaXPAlr2nWg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5b728 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=kmYkUENqAAAA:8 a=VwQbUJbxAAAA:8 a=OUwkjY6KL-vEgWlMa8UA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=p9kz6gysRiz6SGr9lVkz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120051

Hi Natanael,
Thanks for the patch.

On 11/11/2026 9:04 PM, Natanael Copa wrote:
> The cpufreq core skips requests for the current frequency, so a policy
> has no voltage constraint on its supply until its first frequency
> change. Another policy sharing the supply can then lower the voltage
> too far.
> 
> On the SpacemiT K1, both clusters share one supply and boot at 1.6 GHz.
> When policy0 scales down, the supply drops to 0.95 V while policy4
> still runs at 1.6 GHz, causing random crashes during boot.
> 
> Set the OPP for the current clock rate of all CPUs before registering
> the driver.
> 
> Fixes: 3b9c34556fc1 ("riscv: dts: spacemit: Add cpu scaling for K1 SoC")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> ---
> Reproducer, booted with cpufreq.default_governor=performance:
> 
>    # echo 614400 > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
> 
> buck1 drops to 950000 uV while policy4 is still at 1600000 kHz, which
> crashed my board within seconds.
> 
> Tested on a Banana Pi BPI-F3 with v7.3.3 and v7.4-rc2. Without the
> patch, v7.3.3 crashed on every boot with schedutil (three). With the
> patch, the reproducer keeps buck1 at 1050000 uV, and five boots with
> schedutil were clean on each kernel. Not tested on other SoCs.
> 
> Other OPP users that never set their current OPP have the same gap. If
> you would rather fix this in the OPP core, I can rework it.

Which other users do you have in mind? Apart from K1 I couldn't find
another in-tree cpufreq-dt platform where several policies share one
cpu-supply. MediaTek CPU/CCI has the similar issue, and
mtk_cpufreq_set_target() handles it by not going below the boot
voltage until the CCI driver is ready, so I'd keep this in cpufreq-dt.
But I'll defer to Viresh on this.

> 
> Found and fixed with the help of an AI assistant (Claude). I reviewed
> and tested the result.
> 
>   drivers/cpufreq/cpufreq-dt.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
> index eb15650f99bf..2646dda10aac 100644
> --- a/drivers/cpufreq/cpufreq-dt.c
> +++ b/drivers/cpufreq/cpufreq-dt.c
> @@ -153,6 +153,30 @@ static struct cpufreq_driver dt_cpufreq_driver = {
>   	.suspend = cpufreq_generic_suspend,
>   };
>   
> +/*
> + * Set the OPP for the current clock rate, so that its voltage constraints
> + * apply before any policy can change frequency. Otherwise another policy
> + * sharing the supply could lower the voltage below what this one needs.
> + */
> +static void dt_cpufreq_set_initial_opp(struct device *cpu_dev)
> +{
> +	struct clk *clk = clk_get(cpu_dev, NULL);
> +	unsigned long rate;
> +	int ret;
> +
> +	if (IS_ERR(clk))
> +		return;
> +
> +	rate = clk_get_rate(clk);
> +	clk_put(clk);
> +	if (!rate)
> +		return;
> +
> +	ret = dev_pm_opp_set_rate(cpu_dev, rate);
> +	if (ret)
> +		dev_warn(cpu_dev, "failed to set initial OPP: %d\n", ret);
> +}
> +
>   static int dt_cpufreq_early_init(struct device *dev, int cpu)
>   {
>   	struct private_data *priv;
> @@ -251,6 +275,8 @@ static int dt_cpufreq_early_init(struct device *dev, int cpu)
>   		goto out;
>   	}
>   
> +	dt_cpufreq_set_initial_opp(cpu_dev);

Does this need to apply to all cpufreq-dt platforms? Could we detect
this dynamically by checking whether the policies share the same cpu
supply, and only do it then?


> +
>   	list_add(&priv->node, &priv_list);
>   	return 0;
>   
> 
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620


Besides, Sashiko reported some issues, would you please have a look?

https://sashiko.dev/#/patchset/20261111130430.10359-1-ncopa%40alpinelinux.org


-- 
Thx and BRs,
Zhongqiu Han
