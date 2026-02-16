Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EAC23A9B3
	for <spacemit@lists.linux.dev>; Mon, 16 Feb 2026 09:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232478; cv=none; b=LSrXI7kMcipGHOgoVsCc68gEGSbAvuX7vUpmcTVi/BPWXDeJx+NQyWYsIO9QwvoA/q7Zyj+4DgIEsMF9kcdDdKA/L4yBFsb8xRuTGIbDhiLbQl3Q/Y3bk7qvfpTIxUQruhKkxeWk2Yn94LThcOfhcDG9u+z09F4kBr59oYhCFZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232478; c=relaxed/simple;
	bh=2MLUkdf1st2wI8Mhpz3EHSzrYYrzKyvFdnclNChQ0Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uScQbdaHm/RAcc2s2vieebWS0hTVUGAEaMmEpQ7cjIim/65RdxtbodHxQp+Akl1BVWCnwzA2mCdfkq0P0GKbQRzIW8rSFXl6ya97Qo+PQz1o4lxLr+lhKKzP8SrKICiYXS2eWregI17sBSO193ZQ2iKaPayniTfTvCacBcQVqe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXLSrthu; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXLSrthu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4830b67aa6bso3452325e9.0
        for <spacemit@lists.linux.dev>; Mon, 16 Feb 2026 01:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771232476; x=1771837276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qHnHPcuynIqTUxCpCO7mrbWmUqF4Rxqiy/wTilKTles=;
        b=QXLSrthux7/D/6Cjptd81X6e8NvP+cd76LGDbkw8axJwTyt6OEtQENjjtsPHZo+b44
         DZVJoefVS5ySJPAqNJtqhO5eIG6cyRJvXxnNSg0g3nE6h0BrA7luUtfmcW1RIM9KN+dW
         TUtBTkwUsPkwSu3sAY93JL3/ND0lBkmU3IMUCAdNXjaYg7DQjjs74SBMFqampA19KCha
         1cbFExnxtjLYWled/NNpm3PHRwMMfe26oJPkbanvlZeb6O4A52qSGpD1lWUzPT/zh2zD
         pb59VfCSE360AFJHymPpT5sM2RiIjjyj5O5xLaAuU8GczBKYE6WzfztuUaFYgUNBkSTw
         mkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232476; x=1771837276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHnHPcuynIqTUxCpCO7mrbWmUqF4Rxqiy/wTilKTles=;
        b=TQjUaNJTjqM8I/Mx/4q8l3ZbEjDimBh4wUVRnS+LvACp6MYInEHtl4U7QLG0/ok81T
         iPnKBfBGviKDTLGqfM0IDaFT9nBJ+zQj6T6+nHrMKaWsQfZaDFsgKsa9yUNP8vPYHWFr
         8r7YGIBpFfs3lRU1/FK31DZVK0XMCyInQT35yT6r3hhviqAX5TQmJddm46fpRPd+E/c0
         s2N+7vvxs/aXFrvSg8S8sxRqy+zcQjg6T1gmTPfg27ppl2T3tzqdMBdUeILJQ3eva8Fd
         sAIhH8CbK/49mi/NvacHeY0KtLk26DpwWRQQSIyX0e500WtVo88kjaVundoISJwlz7+q
         Mj4g==
X-Forwarded-Encrypted: i=1; AJvYcCWhNkbhg0SVdKWIyqIztubDl7wzKs5BEMeG3nc7Sca1b92kUh6J24Ci783rpJUuI6Y1/yBg5WT9Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr0o5+OzqOScEy8KxXgC+jxn/4C/s9aGl7eZxTQTT8UaO6z6IL
	O7WQU6GeJllCPNCR5zciF8WFf+k9Vqrj+9eGpjihUA0SjzxsKOyhaAAO
X-Gm-Gg: AZuq6aKiJHvIlU45OVUVa2/I5chQXHvoKKKSWtku/jjRZSbQfNu0rCSvNEpV4V38ZlB
	kM+3aY44wdskWQnD5qHOmJxl4+An4hQw7AlNTujSPupYtWmdDyIKFc+TMOdqjJtkPd3SPv3aHL0
	JgdDT5zYZKFilLRSNVA3YCKgRQsqt4thP0IergreQWuhRh4kCA8JRZf5jSFFIEKTPj6Bv27L+FJ
	4FxQNLVYa+gs1U7FQ6E+zLkGiE1IrG+v6zEAHR1Kcsci4qkrGLj6Zp6aLmKuydUBobAYZKnrlzh
	O20QJj7xSMynzxmpPTMAwBpJ9iihfs2HBRKMKxC1r2VsuxUGkp/O8HL6l+iNUSl+OljQQKaQIc/
	Y8yGOmCpXaE8NbTmwGG3GNJeyi5kdqxxWx6Y8wybS9dChh+MFyzIcKxk7wO58lWI2jZIo1cZqf7
	iinLNWtY6t3bfa8g==
X-Received: by 2002:a05:600c:4448:b0:47b:d992:601e with SMTP id 5b1f17b1804b1-48370e2b6bemr118797125e9.2.1771232475530;
        Mon, 16 Feb 2026 01:01:15 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:68e2:cc27:74c:c083])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a78c89sm249517325e9.5.2026.02.16.01.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 01:01:14 -0800 (PST)
Date: Mon, 16 Feb 2026 11:01:12 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: k1-usb: add disconnect function support
Message-ID: <20260216090112.n5jjpui3luqsybb5@skbuf>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
 <20260214-11-k3-usb2-phy-v2-2-6ed31e031ab4@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214-11-k3-usb2-phy-v2-2-6ed31e031ab4@kernel.org>

Hello Yixun,

On Sat, Feb 14, 2026 at 08:29:15PM +0800, Yixun Lan wrote:
> A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> it will fail to work properly during next connection when devices
> connect to roothub directly.
> 
> Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/phy/spacemit/phy-k1-usb2.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> index 342061380012..959bf79c7a72 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -48,6 +48,9 @@
>  #define  PHY_CLK_HSTXP_EN		BIT(3)		/* clock hstxp enable */
>  #define  PHY_HSTXP_MODE			BIT(4)		/* 0: force en_txp to be 1; 1: no force */
>  
> +#define PHY_K1_HS_HOST_DISC		0x40
> +#define  PHY_K1_HS_HOST_DISC_CLR		BIT(0)
> +
>  #define PHY_PLL_DIV_CFG			0x98
>  #define  PHY_FDIV_FRACT_8_15		GENMASK(7, 0)
>  #define  PHY_FDIV_FRACT_16_19		GENMASK(11, 8)
> @@ -142,9 +145,20 @@ static int spacemit_usb2phy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> +static int spacemit_usb2phy_disconnect(struct phy *phy, int port)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(sphy->regmap_base, PHY_K1_HS_HOST_DISC,
> +					   PHY_K1_HS_HOST_DISC_CLR, PHY_K1_HS_HOST_DISC_CLR);

Please align function arguments to the open parenthesis.

Since we are in the merge window, it is likely that new features will
not be picked up at this stage.

But this seems to be a fix for existing SpacemiT K1 support, currently
in the linux-phy/next branch. The linux-phy pull request hasn't been
sent yet, so if you can resend just this patch and we can get an ACK for
it in time, perhaps it can be included for v7.0.

The K3 support should be resent after the merge window.

> +
> +	return 0;
> +}
> +
>  static const struct phy_ops spacemit_usb2phy_ops = {
>  	.init = spacemit_usb2phy_init,
>  	.exit = spacemit_usb2phy_exit,
> +	.disconnect = spacemit_usb2phy_disconnect,
>  	.owner = THIS_MODULE,
>  };
>  
> 
> -- 
> 2.52.0
> 
> 
