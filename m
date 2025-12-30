Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8267288C27
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 00:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767055821; cv=none; b=PuuF+DklPM9O4V3voR52d+Z3+C8eVQ53p91yysPb2adaNILyKe81S2WG5u6WwBhtXWw4wV3nMpmKe7oPGKistm8knm50ALYW1X3LxmR/cDkIfmJQuXTRi3CL32Wy4z0GlIOALbT8QZxIpSSckxJfFgic+dMStEx6FQ1tyxC+kOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767055821; c=relaxed/simple;
	bh=NLGqiqnGiqlrrX/Jn96o+ScgglAgd2yYpoAiSl42MiY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SUNpqYkb+FOrCVlwXCVPlMrngm0wXgo5JQdxwgRny2pTsiUPbOvA4ZI90XxXjMkwvmhFAwfsUQ7IrLzyAOpTY1wauIBaBLn+15tOXAVe+dlNlU9LBc3dz4C5MQEqHHBDD3N60sudlUFylELORkZy4Fo/tRW6EpsGFP5axCDVuDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Hb0a+FTG; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Hb0a+FTG"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b23b6d9f11so1066460685a.3
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 16:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767055819; x=1767660619; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GmB4IaDnBQbcN0DZ+rksSqBNuUUAz/TbWbwNTx7EuUk=;
        b=Hb0a+FTGAC68clUuvGmmAsbPGoEgSQ9wfqmTWwgqV8bfUqLMCn1t014IpVPtGwndBL
         IQAigW1ScukjBMhAAHUmQZULh/atOYruI+bqbMO74v7kku6EyrBUfe4cvu/GCed5JqJ5
         RDuqHp+4qfKlhVeyYRjMfRdlRJkFpbFxhWQGrXjK5U7sb01Fii7RapJdObPNHBeohDB2
         3l+sFc6U9FmrdoIOSr6A0wF23NN97ljJ/sdXkNyER0dm+gKvzrWX1FDiIbM20Gbqzxki
         Yqe5zWL9X5vzL0aBzrNdvHXR9DbUYaCL0xP2oDm3HQS7+v3vQLSKRFKJ5cJwLFVweUL4
         meug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767055819; x=1767660619;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GmB4IaDnBQbcN0DZ+rksSqBNuUUAz/TbWbwNTx7EuUk=;
        b=fxXts+tH/hN7TVKy7/FwvNJGPu5/4nWeYHay3Due8Vpyu4HNCRPWMowZ8DMJK3vlBE
         KkxS9x+qz3/xfen08fzoZaj8mQ1q1lJce2eD+RLSP+fYYvFJuIGb9U/+QQCZblDeVmvU
         ZkMnjlqa7iR2T7y0kG3GQOR5XtZfP0pv50SNnewkYi3FgB5yIGK2ARHRXnw87YXdfg+M
         cyhM4lSQ5L2fxWm2L5RGidfA8R65RivMO0cRDlM3iw+8t6LDRMB+Pp/Uefl13u/GebUM
         7oM+mf5eAp/q+cFFo1EVUY5n/kxpcoYl/qX9aZ3TpceD2DfwLYPFTiOJJXtEKDjEtec7
         JDyg==
X-Forwarded-Encrypted: i=1; AJvYcCVVBLSCMJF5nOQUoZSvlIp0mg88junCfT7jGbnh5Xy3BYgHJZlof+S6Jhmk2VcaZnw1WJw3QtRZ2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6SrCURn7m8rgUNHREK7XfU1rKdtRbaqOd9evvDRBFceXQP1CI
	7HGMM3c7VKt/LyMBEGmcFHqhtoae16GPI0/OjtZ+dVbNukVOismDbdGJQBlZmjU1FQo=
X-Gm-Gg: AY/fxX5WLTZwpNDXtBfsHE976UL3w/sou8LXjZzIxUVfZda+Vcnucl+0o25+rVCN8F3
	5cps0YQ0htv+lilWAtWtSL4OZoj2qcLquSUFNPB0vmRH27Vmn7M6ON1J2qMLgL5Hx8dalzYW2EB
	0Awc/Pyk73yzWZY4RNlG79d1j/PH4wBrwGzRDFLYcapF6NNjouvyke8wRKmSjoFcku54UcjihoC
	qliDHxZjTmSsxgoSM1bA0DnoqBq8B3dkQm2wFmtXGtDIa8mKBO6aD5ttU2lVKzPzNaLuIgcXTD5
	sXwVdji763fBo8730exFZu6MTSBMGgLT9JNiHCcP55hB3s7Ym1Dsl3Yg9jCVfqfuryNcOTNS+JN
	3csp7dF0vfOyBKcq+OztrchI+/eMb7wqpNK0AaJZYcrILshOc9BrIx4okz5pcSQuSFV9C6smYwH
	dJ3a1CaqZL7+de6oWQ94C6qb4uqu8w/FpmlmeSUpN4UpUWIKwhgig=
X-Google-Smtp-Source: AGHT+IEqx11qIx1fExQIVt8RthOfBqirsnQypMP24TGrYewLCr/1F0cNPLqYX2PYXTzLqSFzTJNaAQ==
X-Received: by 2002:a05:620a:2950:b0:8b2:f269:f8a1 with SMTP id af79cd13be357-8c08fabf8f5mr5613056285a.71.1767055818602;
        Mon, 29 Dec 2025 16:50:18 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096891558sm2482817485a.15.2025.12.29.16.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 16:50:18 -0800 (PST)
Message-ID: <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
Date: Mon, 29 Dec 2025 18:50:17 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
Content-Language: en-US
In-Reply-To: <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 12:55 AM, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module,
> the auxiliary device id need to be adjusted, otherwise reset driver
> will fail to probe.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   drivers/reset/reset-spacemit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..8922e14fa836 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>   
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu." _K_RST(_unit), \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}

The above macro is named K1_AUX_DEV_ID().  Why don't you
define K3_AUX_DEV_ID(), which could use "k3" in its name?

Anyway, if you go this route I suggest you drop "K1_" from the
name of this macro.

					-Alex

>   
> 

