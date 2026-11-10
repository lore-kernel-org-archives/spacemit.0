Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794345341;
	b=RlUN/Nm4DHDmP+sdvVA/MAPHBuai/ujUTGQ3FXV7g3T4PCe0SlkVdKtUfI2ePW5dqPed
	 jEmY1sDaJfbuzFeIFQTrP+72HLwoP3fYaqqyOIAHj/8dkcJXNc3KWdWDetBK/OXV1KjFe
	 oYdt22O9UYrFGwIAYQUKLou8erYW/8CGAqfX5YryBiJDCYV1oZxgpum8WRdi8fNG7TfjU
	 +RSJ/YUqhQG9uDfI9Vf4VoR3BzHjoxW+ef9Mf/ioRhOtdPI6YNmTsQji60KGKSRJ5KdSr
	 lFWxGN6aKFAOK/qg9pazNwDVzgmhL+4lMxbHLiv559xvY41M6P2G3a3z3m3Sy1+wBjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794345341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
	b=ZM7NQ+ymqljvZNADNn34+bZbkmZHM1fUOKiP2PzO4gpdD8azgEbh59lmYFSTulKNKuiA
	 gI8bAEIFPJZ39pbKZX9Pybm/J1NXKhg0TnwNn6UdBZnslHSV2AJ6IJ2ITw92FzYHwQsJO
	 TultAvCAUx4N/hGZZxjkhgQjNhgczFptv3wBA9PKKDaqlR8u9tELAR2tkXMasmE8BlJqQ
	 RocZ44EqQ0zlQpJxOxnj4ebVLSH/TgXl9V5Tn1wG3PPRI4m5XEpd3Ta2aREtWlMWYoeHx
	 DlFws1MFqNGt1yrmlZUB4blUQoLnifWp0nHQm4c4nqc7LeNUsmp3K1zomEy1v6lYrpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b="zdw/3pkp";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61255606A321
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 21:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61255606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=zdw/3pkp
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2494597a34.1
        for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 13:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794345340; x=1794950140; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
        b=zdw/3pkpIYV//MY3SMCNddVqb4tKvGSGKpbeIy6b74P52lPYfw8y/7dv38OC0NEmol
         sCfLcyRsM3V6DrOQPFFXmzkoz3oXZV8jPzemTUEeN2wy75M2jscxO5RlcCLPGYUfcPre
         eefqae4pNd6DgOEFkj3X684Dl/9wNTzPED8dMOsLgSf5ef8SXFdU1pzJ6yQYwjE0uaL5
         f9svSJd5uW7hW7gul/EF0BYyTJEZxWPuCgYxK3UA9NTo63aS1c83XmKmAVdARKK+SQWL
         axxXGZ3zK75fI7gV4MzPceeDH50AWNLZAjfzrtFonAebW8ADmg1b0uUd/j/tvPvEMUdZ
         csdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345340; x=1794950140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPELBkmgWuDcQIUl+1C2gUiqdih6G+ZfnSfUpv7B6os=;
        b=cYPMG76AEKoVm8FCQ+UIWnlhniMqpEApjR5ndZt4eKLtxI6eW032A+wHpaCYD4c1LA
         3tHVEV79LXgfiP+/EFRbkzvYZQd42cXEgNk2d62X2lrY34Ig6+57W7d5r7d0sN8ehGyB
         TzynUoW+eb+fgPuUF6KpAjIs7RdaI+6ibq5DzlIjjZFgQccQ3Tk/CvLSqahpkJF+SzZT
         AMNPtgYJ3EeRkB349Y+LG6h4H78cXHlJP3LClhcVsyWB+aa8UoYJKlRVoRZ8SXPAOidn
         dyWGDnli0N9l9lsz1ahwB1hshAocqNy2A/RBWmHaDOh5M30xR/bS1sU734Pv3Pygb5vU
         pZjw==
X-Forwarded-Encrypted: i=1; AL+hErHHjPK7shaVcbUDM3pTQ2FJOFcYAOQRy8fHcsIamoQKw8v4cpN5X/Ir9Atl0J7giK/soZQJG6cRtg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9qMMXMy+OqpOxXFC+kDAgIVNE+9ZUU+v/e/imkPjwQMAwCJaM5
	MTvIiJIeyozMzSJg2whP5WLA0GJSDDivlg5kyQtEaveWHzCp2dOYo0r66nAyk95UKZg=
X-Gm-Gg: AYBFou0+QPu2UxWGOItKTCKNjUXWctQLavQ9dNKaq9iVXsq1ppo0PjQdGL/Bb8i1tfS
	bDJg6xZYHWtzIYDg3hML+YFfVhj3QLZca+IuBrZgCzOUrw9l9jQtmpph7I0JmyQduiHgaQ3NAXq
	pu8THXIp2O0rIUgZ6yFoilV/I4RMDPwfnbthHTosLwDtpmGP9vxzl7e9C4n4OtGjNke//ld9na7
	fX3nznPflwMh6B7HZ/eR7kPtYXq3p5oNd4dsomRqs25ME+o1Y/eu0upvQuVnnm5rfVcsH3NfuG3
	A6WdeJDtFC3nwu21HkRWE5FNluMcob7B8rToBfu8sOb23C6wQsvOYWM/jsXhkgB5UQshZHu/3Yy
	WWNmkgnHOcqe0F0NFAWnf8bCU0475M4XQq4uhGH2n90Ohj781/G32J1vX/GAcbu7ka07WGaANDO
	piGwEI9X5ZRJBfI0FcYdLDElr76h/7Ttxlv3zrxwkJbvNjcuQP1L/skTvFNI39k0q+gBOMK+ylD
	zSL0rBJJwXsbBNiN5NR43KFODGSczuD8ovcPrlHGA7yJYO4sHgeHHQ6USaxYqJUlu1OuxY8IfN0
	dMbdB8rfcepSyboUOGIX98fXMJioTw==
X-Received: by 2002:a05:6808:c226:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-56b96ad0741mr201899b6e.18.1794345340222;
        Tue, 10 Nov 2026 13:15:40 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690573604fsm3142441b6e.9.2026.11.10.13.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 13:15:39 -0800 (PST)
Message-ID: <be330e7a-f37d-4347-b815-22bba165defd@riscstar.com>
Date: Tue, 10 Nov 2026 15:15:38 -0600
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
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in
 atomic context
To: Anand Moon <linux.amoon@gmail.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/26 12:14 AM, Anand Moon wrote:
> The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> to wait after triggering a bus reset request. However, this function can
> be invoked during atomic I2C transfers (such as power-off or restart
> handlers running in atomic notifier chains), where sleeping is illegal.
> 
> Replace the sleep operation with the driver's internal helper,
> spacemit_i2c_delay(), which conditionally uses udelay() when running in
> an atomic context, avoiding "scheduling while atomic" bugs.
> 
> Assisted-by: LLM
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Alex Elder <elder@riscstar.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>   drivers/i2c/busses/i2c-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index ff32876e24d3..f4b21d7efaaf 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -332,7 +332,7 @@ static void spacemit_i2c_conditionally_reset_bus(struct spacemit_i2c_dev *i2c)
>   		writel(FIELD_PREP(SPACEMIT_RCR_FIELD_RST_CYC, 1),
>   		       i2c->base + SPACEMIT_IRCR);
>   		writel(SPACEMIT_CR_RSTREQ, i2c->base + SPACEMIT_ICR);
> -		usleep_range(20, 30);
> +		spacemit_i2c_delay(i2c, 20);
>   	}
>   
>   	/* check sda again here */
> 
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9

The use_pio flag is set for atomic transfers, so spacemit_i2c_delay()
will use udelay() regardless of the delay period.

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>
