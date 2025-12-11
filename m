Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024781E5718
	for <spacemit@lists.linux.dev>; Thu, 11 Dec 2025 07:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765438544; cv=none; b=mmbPMZqEE+JbhVebn8Vu9TjZ1URdIbaS4m3Cr3mzmvv3QJLxeWOviHM67hnrChi1ZIhXbIKYoKVV+wrKJJIu4U+JSKFEFbK2KtNeYeUD3F05LDGZ1anHCE3N5Vl7uBkfarnlVWs8qQKzkOXjGRDV8QQ8V4jQzn9SchtN7rSwF/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765438544; c=relaxed/simple;
	bh=D9L3NlYN0YqGBEdLUPdxfdpbeolFXHZmFSSeiZG1E+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7xYTgZGNtylrFzoPgTupWzwvcqM12mk65en1iyu6nkVRXdcKjCR25O5UFXwtduRT+XUPOri3l4vzsgNEpDQ3jUq07TZuxF65tr/PYav+h6MbllJxKYCA4KXTuifbVvACQF+udG0s+fEw9ayA6Dz8ExhntCKEJuNBqkuX7lnwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vaNqEjeG; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vaNqEjeG"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso569060a91.2
        for <spacemit@lists.linux.dev>; Wed, 10 Dec 2025 23:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765438541; x=1766043341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cRIyUToWBqfDVg5RwgWa/mJtHaJ3ZD2Xr1P/TceRSA=;
        b=vaNqEjeGWXE71ZsppwSjJW0Q1U3c1NB0qAjGzhXna8KGPE9a8Fc4runOUuHJp5bciD
         lPmPfOcRX+TGZzudq8GXZd4QYlN+b3NOiQKTMJa6Kk7hHCqs1wzSkIY9hjg1b1UULhsW
         4Ytk0nl8KS2D3b6yWM3QfhzDpYeg/Hl+tEJ37Z5i5SWhdoR3BTxJY0lN+Nqw4niQjYyy
         5ROzWzCYWEg6sbJMD68UYvAv0MVD03l3Bg6ar6oIZEwVDMhhtmL5yLwY/VP6lkylhnoO
         h2PkwDa6zF2XvB+HXIa7z12e7hdi1HLe5juoG8tKxC4f+2/JOZ2MaxAHFABoyrv93Edn
         VWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765438541; x=1766043341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cRIyUToWBqfDVg5RwgWa/mJtHaJ3ZD2Xr1P/TceRSA=;
        b=CybWCfENH/zcU4N2QRazYme2DiQsmWbP08WXhKsCRWNXFpkjRv7TuXDzSbvsquOxWd
         6FJEfSDr7Ab5MCXHzaNOGDi0g6e/RSvHwatpikPrA2N1PUVqwprPHgp5fu2b55/YgVIa
         8UeDxdpfIxd0+PLQj2p2i7tm+iYIJzNxQPV94q/thOfho1bTDXcLlJea+ySIHQMXPwOE
         Rfm58C1FcJUknRmM1oYjLuJU+xSCMFVnX6subrcMriXIi8G0V9mVLme5UNmt2DkQerm4
         HhJb4YqtCUGwGF4IdlyXZ32cuT1+e7JFhBYsW6gAiKTtxEaiaXGsqUpTYpxKsStiuZE/
         CK+A==
X-Forwarded-Encrypted: i=1; AJvYcCWGlekJsn+VrQtftGvXqUUkkqeQSxWjrTxxJeLc8aDF6YrLVKF6yWlR9lIXF1abyGUBAcsRugI6Xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdgvF7+goFSi3/sq/9DE4LYtF71QTAufzlkYobniL3BqDr3zk9
	CNkwcMx4eY7KOyoyxy0nqRrXzcrauU1L9+acMcUxVGPrCnOV7ooBP2OwL4M77FfWQiA=
X-Gm-Gg: AY/fxX5Ouwp5f7rTH7FH2cLQT9lSigP3n0l6rq70OfppLTtmw6katwbxDND1ZoeNPxK
	0qE9YhIo9+ScZPtmDINN77ykGlIoSkxUg/J+Klde488UepAkIsBtZF9shCws78PdDhOyHkNHCQK
	MVYMZ1hxavw6c32OrVDYWKhjflHx9eLcYcHY2rRvG8sbpaVmPo5aFWdyJsgcn05DKpPVTR3RBM7
	3xCODwWtKowH+1A11JwVX7f2caP5VOIfjVp8xWkjf0Wf63uOZ1qXvNfG6wnDhUjUy7QYzhKAPBQ
	zHm1OkfTQkHT8sWjHqQIirr1tZ4dTzCcyqgPPE/8Qc07GMF2+pddqamebwz2k9e1bUJB7lxq+cX
	hbG7tgLu2BTFJMWqbLIUSKRFcquQbwadtnoApeDZ3o47s9wp4mBwpCiflZzGiNWPjeUGtdTxn96
	lhge289qneUDs7rG3Tcv2N1fGY4twwltG9SFshhGoNhuXvhb4=
X-Google-Smtp-Source: AGHT+IGoUuUHw4G8GEx6LIfCNmK4Wz0P7Vv4+W+//KXKrKQNRYKoJQHJnPyRAtlt73kARbQ3vU0CQQ==
X-Received: by 2002:a05:6a21:3086:b0:366:58cc:b74b with SMTP id adf61e73a8af0-366e07dae21mr5212459637.21.1765438541298;
        Wed, 10 Dec 2025 23:35:41 -0800 (PST)
Received: from localhost.localdomain ([2a12:a304:100::202f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9277e13dsm392594a91.5.2025.12.10.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 23:35:40 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: Re: [PATCH 2/3] i2c: k1: add reset support
Date: Thu, 11 Dec 2025 15:35:26 +0800
Message-ID: <20251211073526.3164875-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 19, 2025 at 07:46:44PM +0800, Encrow Thorne wrote:
> Add reset control handling to the K1 I2C driver.
>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612..64d817d8315d 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
> + #include <linux/reset.h>
>
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
> @@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
>  	void __iomem *base;
>  	int irq;
>  	u32 clock_freq;
> +	struct reset_control *resets;

Thanks for the patch! A few suggestions to simplify this:

The reset_control structure doesn't need to be stored in the device
struct since the devm API automatically manages the resource lifecycle.

>
>  	struct i2c_msg *msgs;
>  	u32 msg_num;
> @@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)

Please use a local variable in the probe function instead:

       struct reset_control *rst;

>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>
> +	i2c->resets = devm_reset_control_get_optional(dev, NULL);

There is a new API, I would suggest this:
       rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);


> +	if (IS_ERR(i2c->resets))
> +		return dev_err_probe(dev, PTR_ERR(i2c->resets),
> +				    "failed to get reset\n");
> +
> +	reset_control_assert(i2c->resets);
> +	udelay(2);
> +	reset_control_deassert(i2c->resets);
> +

Why you need to call assert() then deassert()?
Wouldn't the single API fit?

Best regards,
Guodong

>  	spacemit_i2c_reset(i2c);
>
>  	i2c_set_adapdata(&i2c->adapt, i2c);
>
