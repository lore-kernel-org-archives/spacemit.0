Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD442BE02C
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722807; cv=none; b=PC9YxmVLvEw/O5Q2kYOLG24dVyoAERa7Xq0hKekDoOpux+UvAG0C4RFbEFot8HKMIPPk4r0Mqsyy4W/kuAI7w2s9gd+cME/z79TT5/HxK0/MBfy8K6k04pezi+wGEhuzTiTJDRjzAA0mtIuXVIi/fak93kU2fZRsgvw82EBVIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722807; c=relaxed/simple;
	bh=AgSIsFIB5hJk9F7GwArLvCsxDs8srGNqiUbKoqtKay4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnaoAtfoWC64X7HTN4gLIr0+9QxGmnh5SExgGkKDs3Iuxf8pNDDyCHAHmWm/5gN9Lea2IUHskN0De/L3WeAvs5SDdxYt3qsgTS8WAeFkzjELUeEN9TJlQFznuu7lvrA2H28dZ9QsORPJgOK2X97GFyLhLTR/2WMjAZBVuEi1fmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=XalLXeT9; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="XalLXeT9"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e5c92c389so846172485a.3
        for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 05:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1784722803; x=1785327603; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qvzOJZC5dLwV+0rw2sHYPHDnXSJxTaB22HkTCSR960=;
        b=XalLXeT99pPb3W4dGVEAul+LP1hBljOAPFEbu9r3DzQBdR8OwbIsMZMl8bgfiM8aoz
         zK8G4hL/b8crrFdJwL0/1/4Nx/9c3E52VsPXZ8A/8ct9TedPut6JPQvjPHXQZnogZcnt
         rkrMi8dONQkfFnw4/Hn/uGvQRs+Mk3iffn72EUdyBD8oyM9J2snk0wGVW7yRgiqdX/Ih
         6cOWSbaLpo6mOFzKGNKE4uZBG66afh/lCOEBq08cIZQe26txaRZ6mBH4EEOOWsK21es+
         IdKN5spBDAwu10MjSil1K9JfbP4rFjrs/sVJpUSymuVo0RSShBJgegFxwDrvfBpdqmW+
         WKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722803; x=1785327603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qvzOJZC5dLwV+0rw2sHYPHDnXSJxTaB22HkTCSR960=;
        b=duZJrRG1WqkLl8+xQ/cmrXRFDZ9eZWL9yR7YQObCqZbp27KC0/OGH3wMmbHrzE8ADw
         g9BuwzVQKtMSqO7tKMWknW08Y8EWmqNlFhHHxWsbeh/CTl4ylcvHT2tqovD23WMigXzu
         yDy5CaGb27dhHgQ5IFIPr7ZsMDY0srcb75jfc02dThBtG0WF0MlZpNmDQ1jY0UeEkXB6
         w55k/0R8DyYcpfJ3s4PbrP5PKnrt13O/joUWurasORzf/LBvaVo/R2oc7Ee4YnwCawHQ
         FoPvuY/8t/pPInWCjOpgMEmKWsbCjDB56S7+h1fFaYh6ND4VGkZU0dw71oHbaWbvVfCH
         MNNw==
X-Forwarded-Encrypted: i=1; AHgh+RrgBLCyiSsjng9o88FtksxxioROs09xmwDsqGF8hceiY5Mh0KG0T7wEv8c2kwFArY4mAnWLO+wpig==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYti1rY20Xpds6SQMOSdZQgBJTIrDGk6F2Uentv9xMyn47vCvY
	Qs1efaGrGssvaWzPxniYJRW5jYvehhMje43LK3BxOgSFZBeJsxUGwpdPcOz+M+xzQNo=
X-Gm-Gg: AR+sD121CHzAl6uNy9wEt8VW+6isQfXH9AdjRBQxj+O82EHTyn9Qz2nzNDPNDbLoOIq
	S5ei9J6LRUsip4h1bKKH688Q8fFpVsVspsWS4bWLbdWh1kU7t1/a70Af08/FsTIKl6vpKxR0QAz
	4rnjKbuHjQ42Ci7Gz3z/Rskm7nTCnfu3LGs7hep0KAs9l7jRTCZ2wJ8F1TayLUBgAwCbIvehQxj
	Zp8xVo2QVxUv221ik8dW2IbtCYDRUPHXc3SEAqRhS+53valACxRHKh7W0e0TIgbwnNgSh1JABml
	jner5OSM7fsw61qisVTkBXhFFnnOrRtwNYQ4pD3JnWyLnd/VfRHDyA8fLYRRTBsPj13JPX2EZre
	871kwrK3g9oi1x4chB9lbPKYK7KC9o7J8vSxcJ6Hi1wzfMa2gT3zXdj/Z8Bb3CCwtjWuejkdzcP
	Ay8w==
X-Received: by 2002:a05:620a:2989:b0:930:f306:8275 with SMTP id af79cd13be357-930f30682bemr389512085a.9.1784722803506;
        Wed, 22 Jul 2026 05:20:03 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68d323asm151978385a.19.2026.07.22.05.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:20:03 -0700 (PDT)
Message-ID: <7d7938cd-80bb-448b-89d0-6ac6d2717e98@riscstar.com>
Date: Wed, 22 Jul 2026 07:20:01 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: spacemit: request IRQ after controller
 initialization
To: Linmao Li <lilinmao@kylinos.cn>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260722094302.2284191-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260722094302.2284191-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 4:43 AM, Linmao Li wrote:
> spacemit_i2c_probe() requests the IRQ before it enables the clocks, resets
> the controller and runs init_completion(). If an interrupt is already
> pending, the handler runs too early: it reads registers while the clocks
> are still off and calls complete() on an uninitialized completion. Request
> the IRQ after the controller and completion are initialized, but still
> before the adapter is registered.
> 
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

This looks correct.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/i2c/busses/i2c-k1.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 51a0c3d80fc9..3fe716cc153d 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -723,11 +723,6 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (i2c->irq < 0)
>   		return dev_err_probe(dev, i2c->irq, "failed to get irq resource");
>   
> -	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> -			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to request irq");
> -
>   	clk = devm_clk_get_enabled(dev, "func");
>   	if (IS_ERR(clk))
>   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> @@ -755,6 +750,11 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   
>   	init_completion(&i2c->complete);
>   
> +	ret = devm_request_irq(i2c->dev, i2c->irq, spacemit_i2c_irq_handler,
> +			       IRQF_NO_SUSPEND, dev_name(i2c->dev), i2c);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request irq");
> +
>   	platform_set_drvdata(pdev, i2c);
>   
>   	ret = i2c_add_numbered_adapter(&i2c->adapt);

