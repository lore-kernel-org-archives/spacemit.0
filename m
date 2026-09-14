Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8FC49CF38
	for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399658; cv=none; b=GZio3KcvfZJRWEhDDHJPzdTTNMrlDrtSDXzs7ctCV+80Qa+XWibEeWXIl0Gj1zqA93q+B3/9BvhN0GtHTczJ99NVx248teVF/rLJzOpKRWWpQbaBGkcFaCDpsXJYCFeZq1LVonMt3yx31YyJwU07JXIpkcHi5uaAr+OfxHI0GsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399658; c=relaxed/simple;
	bh=ZS6o/WSKtEv+tq7yhpuj7HzqHie5XNyiWlWsjAP+xCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFXv5jMM8gRnvEwlFd1TIMa4Rv5Crs+5wM5qJXj1qR6CCdAXnCChIh4lfCVnfvIwNE8dnaN7mMHF+Pvwir12/VMkpZk3UHCwB0EW0exH4GWp5ydjHIwG7WHjYTuPPsAuZtz1I317uOp8ODre6IMFjOeTQM3U7wBY1cSyRK/0vk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ev4J+D//; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ev4J+D//"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f7so14357635ad.1
        for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399656; x=1790004456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PfRkneusuDLpVUWSi6geaiexHAd3QjIrlrdoCv9lokU=;
        b=Ev4J+D//AhbhML3sz8A2BUNKRHuALlkn+43nyfsIZGOl6v3kq84AsK4rga6nc+xkOR
         vn83LzKgVnSoqK/BrZpdVwNAVGLbYyauMDPZcRObXFV7QwKIeSr2X8pMq+SYD/sm1HMq
         akphDn4kaQN3ZWy1I2w6opRYqX6Bq5V9/w9uv1tRla3HGrsKVgLgCk0o+SF+xF1abU6e
         Glvhf/oVVXwYNxHjvIUs/B14zjfv72VbhT96IPx/kmrT87wAsRfKQARMIoxjHDpZAvXl
         N8NCIslvrgdBv6AR8M2A4IKMsS+GKXH2O4bgIGUhDbfPPAd69CWNcTUJDR+krFg33Ik2
         QxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399656; x=1790004456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfRkneusuDLpVUWSi6geaiexHAd3QjIrlrdoCv9lokU=;
        b=gvlI28dLeGi49PjrY043ZUQflsibH2txLYMpnb6qufEFO9QxRCvf+RmUhwysYIAamK
         kL7nZxKMqON8kenfxpEpF6464blLTV7EXBk3fc65SW4p6vUSA/cUcIJsdAb6dtcFSAZP
         M0XYoKilf7ijJBxY8APDl2n6ytx0ZHcItEoJ/9mifjHbCQlVs7cZFUC87NViCFUdrmf3
         mmHx47IHQ7Zkk9Q8nIB3pTGgEcw2Zrsdz7W8fjOmM+2Dj+KNa/ZXBA+DDwpVmsmvjRjz
         dRNfaK7FABfE/b+nj9ZGGEOY54imHSzY2PfJdjAkGtHTUc2bPC2CVdvzj+Hlt204UCge
         Gg6w==
X-Forwarded-Encrypted: i=1; AKwUvBy48aJGNPUZwrlB5GzAdB6BMAyfpNaP1+sjJmA94/TqBWDu/ppPNWH+Vvx5a6fZv1kmcqRhRyR3uQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mQ+dDjHj+U2z6N1otBFh1e+zorU9tiAOk7HxPpe0zPGB9c+FxT
	4B3WXmyBg7IICKvQHvXrlFvUI78KHxdvSnmgEAR/57quARNDU6rDSU+O
X-Gm-Gg: AYBFou1Ha24LJWffbm5S2s/laGJdUhGg3sCovuqIfEs2/Xlw+srcUkMuu3McPx19bse
	z0nn/UTfjr2wE227cPDo/UdVAp/o04tPAA4q+y2Lc8St91Duux65QYU8hL9IpJoU25zXQIVn2up
	Bk/e/0LeT+oR3ma9VxJxCj2wDcbwzSTh1xiPUIdxduIu0Ul1ZYjFxMiiwNcvNOKqDBFPvsDaHD8
	98gHCZlDfApyAY5q2zEVyofBa32WB9JjwBYZKXWH8wIA2qDaVKmNv88E2SvORY9kQ8CdMbgY+DH
	nB73qq5EYbjXEmW7EKCzV8QO2skYqIbBLZfXAqA5VKk3JjUTRHyqA26ljjQ9tyyhlFamyzTsFKq
	LZKd2wMA2RnK1JoOjd32UxiGF+X/Zh2PecbGSf3PZaZ6E8DG/+wlajZuAhHGYgS6WxAPQndxrzE
	QYeUIigIwIXVBucXZJQcDgWDvsNMrMn27xV0Oi17fpPibmpqqio2hf/hYuOv9YHlJdmL2HmM5OC
	co+UYy4GcyE
X-Received: by 2002:a17:903:1b47:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2dd75493c43mr14817515ad.18.1789399655793;
        Mon, 14 Sep 2026 08:27:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ce92e99sm51522035ad.25.2026.09.14.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:27:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:27:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Message-ID: <429a3f35-2ef2-4e92-84e1-be605dfef31f@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-3-522def70acb4@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-3-522def70acb4@linux.dev>

On Mon, Sep 14, 2026 at 04:18:03PM +0800, Troy Mitchell wrote:
> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
> 
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
