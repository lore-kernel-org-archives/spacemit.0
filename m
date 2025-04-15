Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED64D28E614
	for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718516; cv=none; b=avbLX16Vj8Kw5omBrH/jBc86jDEbcyRIdklCrIJ6HK8D7ANa1shHO73kK4adjkwVv02Oktv1bdtFfqDmzfgBnjyJdSTCQ4FM7NlNOEecKcX4WuoM3++yVAJeIW9D6vleBUxYjjkN34fqPEm8kYCRrmuBiLT4SzCZUR8Esj5+QVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718516; c=relaxed/simple;
	bh=VjC0k27ho3MYgE1jSKQLnBF1fNTa+IvnpBnHM8yWMzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMcATN2/Kwa9BVb4yibYO2apPoD2l128sqq3NDWsCyJdDpBykkvqLGB+96F3hpirBGy2l0SfDnmwt+uT/WZPkpuxgpkzP8z2jhTh0iTeK5kHgI4O4xplebUbFXzQMsx4xGnJh87r+688OEqHkvCOWy1cniyDNN4wMGskkLjtPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FmKM0LPh; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FmKM0LPh"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-601c469cce3so1536034eaf.2
        for <spacemit@lists.linux.dev>; Tue, 15 Apr 2025 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744718514; x=1745323314; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=FmKM0LPhOYXz60oDc236mUD26/vr9tE8SCmaUmBpq60qJqOiakomFFKMhTq4wJ4k/L
         nFRbYgf+0/7OR/VG/tHzXRXkDt3nKQqeK7cAPXu2ZdAlseNTlI09ggm7xo7vuOtvoJ4R
         h8rd+rsFqsuVxR/9rQFGX08K8oO2ZkenROgLU8kspzgcUogv+gZUZNaB2fMpsrRWWWjo
         WtZ6cpOEp+csKipwUPvTfYv0ykEb+zlJ5+J+ikc0tn2BlP5y6olcKPSKgnLu8wFg85iU
         AtvnwLBzStO57wGZh5cSqss8E5d99dA8zBOn9P9n7z+u6HueRILXzWGTQ28tBhkRkSfY
         U8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718514; x=1745323314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=kOehpRsiaQz6An+jHfPtf1CU6YWxXBikvgPhip2JJhD+v0XFTz+xz/Pn3SnhiSnsot
         UaQ7q6JPb3aa/TN9En+lFKBiIJN1uvahN3bf2DUQ1FXdmxqAsYcHtYnCxM0auW9bxrQV
         SYN+l4f7ytvcXvNqqagi9CqWDd1Rfqh4ko97GMGZ61KKaaE2oBMnHw8sMM8qvsyfbvkZ
         ZQRQ0IkuuOj3iTGFRyB3iXW+fkH00hOL7veBTxWEQZDtB8SCOxgk7D4Xxv2FDgJHrSsC
         RKhijMBCtmz6zag1csAZwSCp7cvCEsUul5EGfhfkWu20ewO6KzBs/EOsBD9tiW5sBUdp
         P8qA==
X-Forwarded-Encrypted: i=1; AJvYcCUB39YYu4Roid9Zd1MQ1CwYPh54SCVP/jjoslm0jP/qfBL4wZifGs++33rpTK8ULcMNAPr1XJaW+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSLYiGPqY5kGZSHtHvBODq0NbjLeM3DgqLDnvaXVZfqyfwkHNg
	RnvT6sZvNM99RUylP3q/YMGixBMEGdcs9v0HbBIIOlx16nWDekFhC66G0C4i1l4=
X-Gm-Gg: ASbGncssWxKAs2y9ILtr4pyFFV+weUPczE1I9xMfD7tVE0wvxN0j2d9W3CSESOe1Vc3
	LRP1tATKdCxGILCGxxB/S9+mpfcSKLvEyygxgFTokajlNpKc0rq/q1OTshjN4HIxkYtB+Dff1z2
	+ig9gBTKUkv6/SzypoHieAy363g0zCkU+kizEgwqhacKPofX07do2TsYWl7Lzr31c/kk/8WtGuo
	XbwYNfimVhvfqiBowOmNS2otSlg2KpKWY/T8XosvDA28xNMkDdHLMXErHx85jtvkd7yT4143imh
	qB4NItSq7uiFV2fO1bCjhjDx124upkuWFKSTUN7Qk45hORoTz+KsLRH8nldbIy6xb+d0QflEC9E
	4x+zfkTiSWg/w6Qk=
X-Google-Smtp-Source: AGHT+IG1ZefJtDz6AYlU+I6NKPPOmbM1gYq5/4K9M9+cYhFx0WPocorybtDxzIDHpDEm4xA8K20OCQ==
X-Received: by 2002:a05:6820:1392:b0:5fe:9edb:eafe with SMTP id 006d021491bc7-6046f59b8a9mr8979670eaf.5.1744718513333;
        Tue, 15 Apr 2025 05:01:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f522cfdsm2299991eaf.9.2025.04.15.05.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:01:52 -0700 (PDT)
Message-ID: <f856f692-03c6-4064-bc7c-ad565fed6d2f@riscstar.com>
Date: Tue, 15 Apr 2025 07:01:50 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250414191715.2264758-1-elder@riscstar.com>
 <20250414191715.2264758-7-elder@riscstar.com>
 <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 3:22 AM, Philipp Zabel wrote:
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
> Superfluous parentheses.

Wow, this is something I don't normally do.  I had to check to see if
I managed to drop "BIT" or something (I did not).  Anyway, I'll fix
this in the next revision.  Thanks.

					-Alex
