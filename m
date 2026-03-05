Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA29A372EFA
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699984; cv=none; b=VYfllqPzobH0UaC+P6uRX6M3tjJmGL5HmUDJ4Jhe7+zL2mcX/iKUdM6SB2icufUMLg0cExhkNta7MFEZ8AGHIFn3Kmh3qrQKmcm4H29Pzjv8Sy6ORzLEH2cOAQCCpjixR2Kg2SxWiH1GS6P4djcxApXQmcX8iJsPA2QnFAU6Seo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699984; c=relaxed/simple;
	bh=6xaS693NEPvMsmPDTvB8J6q5UsLGM4wm4qipY7xfOGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F95Ri+UTaLRBeuj3Elg9ycOdLTdtM7dTe2kcNTkRXsWYHlp6ULE7j/IRe99KzToFgX4znnVXdWQqdDUvIpQOSp3W8AhsuWsu4dtc7XStrND1yZsMXV/STbz7Xzsa7cZqGiDeVONWGCb5IyQaqKH4/BqD4p7NQOZ1vOAfGCPM3T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zhs1szgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1GG1EWk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zhs1szgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1GG1EWk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Bqjg3482746
	for <spacemit@lists.linux.dev>; Thu, 5 Mar 2026 08:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=; b=Zhs1szgRs6PvG6yC
	/K6l0Og7co3C6ED8icQT7ngtsI9G5Zp17IaIYa/MOFJSyTxAUHo39qtMLOBGQhpj
	JO9fE/F/E4F4LvhAKnAlFKn+fH9sEpkGqfNT9M43WTCJkjqaFeUzfOGpTrDAGNtC
	tA5poP4iW9oFEFa2er9A5XyBDJ8CedmbmCYM1jjJmOXgrD4UqsM96/EbUTiVA/x+
	+Hq4ib0d4uJFejDRNFTAYPM9OxAzG41cfjw0IJBJVDWkmbFbGS1eLwFkvUDxUI+x
	i9yGzbk3U3z2KxBfUGbK5GoyOmpZPSUHhrYGJ9ek999ywA1Q/YTR3XTo5MWWFrPw
	1lqwYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjg6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 08:39:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb5a76f13eso420672585a.2
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 00:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699980; x=1773304780; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=C1GG1EWksO5mERdVlz+46cjoqgS4GdG43oGTJuhCppaUrrvMay036GTrro/dKKAmHi
         v2ptEtsUqxBf4ZLYAiEP6Xgmc5Eq3lNhDOkjPzwHn0wrzNVXzFDZEBmmuS8VJUV95Pnd
         26vZhZ9l0kB2puhm/v8wtIg48BW5DcgwOzXjfP3r9lqLhRbhN65edUljFLtYf+yLanOh
         GdlbOGcdOB7j9Tk86us4Yn8jrF0hgFCnjDrxB4lYEm8NS4NHFZnfSaQ3X2ykVTqGB2oW
         Y6RGdtLvZJRTUasIIS5KfayouZgYCkh7RTn5rNGGTVxiu8+dFo1O5Txd0grHkHKoESsM
         NdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699980; x=1773304780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdWMwgc8nLSwvc7+zSIUZsTz2pEGRMvswxdPfflnvOo=;
        b=BEuMNrT4rs85eH29NaNeSQxmj1RgI3P3yQGS8p6KQ1m3kST2YkpaHf4yJ3Y5uP4h9/
         0ahtxBmYgf+5eup1VLF+GJpXyn7Q4EF7NQxceb9B9VrDT+0DUkBUgyQmSn24W/fYPnE/
         gQQ2we2Wm+8Dsh5bC2f1c873dJ7pG5WoyaaHIo8m52o08CiJG0uJckypjf6cmJH9WUQ+
         NhwM+Ax5gE4bQY5CkI5WIK87guy1OTvE7BcDxJN7EQ4w0SZGE5Y7p5DAviUa/hdFs7II
         9HXSfVfSsZjglQyGK+tPOD0RTE3s61mC4e+1ehBK6kZfJfJtcELBZNn8q3k1ADZN1ga3
         i8rA==
X-Forwarded-Encrypted: i=1; AJvYcCWQXizy/euY/GxppIFOh4W1SEiIeGS9hfyDlfT0URhPZ6PpprQkD9m9RHUg3cRk8Jrf8wIJfzGmkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgLAMc/9966afUFdmfWLkz6FOdhuuQkwsUyQtwtr59MJQ/FjKA
	xdXBC8KHdOl8YAHafOPYZ08nWbTHPdeAvpiQ5slOGKf2vAh1t0XTVM8LKGDWiYWuNV6lOV6Brwb
	wd8QBXvOiZz/arqGF3BD4ibyNb70DnsaTHXTWRUY7yZ9sLOnzENI+W+ApVlhL9Q==
X-Gm-Gg: ATEYQzxRy96PiW9VXr6qt6JiQC3d5Ld/FvDot6qJptY9UFIqbCbp5uRWzoSv30sYg5t
	vN0djqQ4pocyLNrquw8H/sCWsVfxH44sIzvzZNC4X4WYUN2urmuC5Ei9xEGwidxpoAASdOlojQr
	dki7rKkgiC+OLurrMikduyAIdcwoSX7x0QN+pjf6plH8g7EPhWAdAbSSFw+jWp8xnnwG3enX1A/
	a4ZlOPvoEBifNdOysMxNjgpM8O6oeVOqmMHhUipp5I2Ti9AZmc5o4bfVWYpD83NxSsERue+K/o3
	OzDBT/D5wb6fx0etWhRD6/BWyMZv3UUWy/MLXoKHQmz9yP9k5SqxtN+eAdeXjT2Vka7vVy+RX/7
	Hu4WQFl7GnK+VQowuUS2l9QTtfNZE7vLZkRtyPlPVcbrtskvGj+Xxr85fLspoR3Yeha56+JIDdQ
	4yVhc=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452359285a.9.1772699980151;
        Thu, 05 Mar 2026 00:39:40 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cd5afcdcfbmr452356985a.9.1772699979710;
        Thu, 05 Mar 2026 00:39:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fac06e3fasm6657504a12.25.2026.03.05.00.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:39:38 -0800 (PST)
Message-ID: <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:39:35 +0100
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304175735.2660419-23-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vxv6Xp_FWQcP3M1_Ahp-FSjsJJCkHCy2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2OCBTYWx0ZWRfX2hs5Oxu+Y81K
 +oGdOWnrhehnc6Py4rsqXpIp7Nkvy0AkgDkoamiE4gTfX6PpBxH2NOR6oSgjNo8sYMSCYMfRQ9Z
 7EnuCM+1V2l84+ow/fNT52yXMLzXgXz49YcMmHU0pleEohHgyzXgSbaSecmhJ7w3mYDysmX4m5B
 foaLadbt4MQiY+dwlCKaL/fD4u3n3TWsKWutyzlQrxz0HE3ZioDe6kHSdLeaquHOr8hFykmLCnL
 OaHBaZogze77huymEp8Ylk6xuhbDh6kdSJ4LVmTWNN82N7j+LBxLYDZgRVl6BMDeDpTztseF9Cu
 es5fRlku5H2SzE7WQQ8pNWIiKLnu6vHtjRlWof2Qi5f5B4q3IMVQ+cvvlGvFcD0l7Bu7riBn13N
 82pwaKRGck4XEGRKRSs92UE/2SnHirHwNb5xStOsjDx0G7Je0/9CIrBKeWLgJ0O9ZTIgSkoTdZG
 PaH5WiZlNhMtL1BDVig==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9414c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=GJStlgXwfe-SXQdWLvAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: vxv6Xp_FWQcP3M1_Ahp-FSjsJJCkHCy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050068

On 3/4/26 6:57 PM, Vladimir Oltean wrote:
> Some pragmatic shortcuts are being taken by PHY consumer driver authors,
> which put a burden on the framework. A lot of these can be caught during
> review.
> 
> Make sure the linux-phy list is copied on as many keywords that a regex
> can reasonably catch.
> 
> For simplicity sake this is not perfect (devm_ and of_ are not valid
> prefixes for all function names), but I tried to pay attention on
> avoiding false matches on things like:
> - drivers/net/vendor/device/phy.h
> - include/linux/phy.h - network PHY, not generic PHY
> 
> So I used \b to try to match on actual word boundaries and be explicit
> about what is matched on.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..bdfa47d9c774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10713,6 +10713,7 @@ F:	Documentation/devicetree/bindings/phy/
>  F:	drivers/phy/
>  F:	include/dt-bindings/phy/
>  F:	include/linux/phy/
> +K:	\b(devm_)?(of_)?phy_(create|destroy|init|exit|reset|power_(on|off)|configure|validate|calibrate|(get|set)_(mode|media|speed|bus_width|drvdata)|get_max_link_rate|pm_runtime_(get|put)|notify_(connect|disconnect|state)|get|put|optional_get|provider_(un)?register|simple_xlate|(create|remove)_lookup)\b|(struct\s+)?phy(_ops|_attrs|_lookup|_provider)?\b|linux/phy/phy\.h|phy-props\.h|phy-provider\.h

Would looking for the devm/of_phy_ prefix followed by an open parentheses
not suffice for the 'has function call' case, instead of listing all
currently present exported functions?

My worry is that this approach is overbuilt and absolutely no one will
remember to update it

Konrad
