Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414437EFEF
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704944; cv=none; b=Qz+YCDk+lVcJEoW9oUCyodsazAwkyufxERo78HZef5XbLlLzySJwsxr/olYtaq9IsAP1Ow4ph6wE1kFlnUSlFVQIRHHR6DM74X6Q9kJcAvt00+QZTYLR9qRiWBPUeWKfqfm3/XIzHi4k5BlGe0SpOv5JhdENphzBPUpg1SWnDXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704944; c=relaxed/simple;
	bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qnN1Pn68m1VwohwbqjSKcvALPGjIkvUNpLLgxex3XvfUYGktWka8Uk4KWscRsvgAno6qgKIE7A4eO6MgD/tYgLr6Aym1EtgxYei3H6L1RMZmiw1IeTvTq0lgNAIIX7xCERBHTfQNHZjJM/DSV2jibFILd87+KRkKaiCm0tdnpes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRAKJSXV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRAKJSXV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48371119eacso93559655e9.2
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 02:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772704940; x=1773309740; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=cRAKJSXV3rRGq6ApXGxamK2sBKFK8d/YER2e7OWrJWx8Qq82qFqbckr0zNlJru7qn2
         1X5PCVCZdwJtnIOZAyNc8hrCAbClCd03peDLriMPUqFoWXM3bjaBjKpXYOawtucqrv2r
         NAvsAjGF5h3ep/oKpyznqo3ZeesceBcbEJwZmZIzz5Hdb5us8ZUCZ6ezKnrFSlRlYNH0
         5G9m4zhNQJyVz0moPEQi9bi+yd7UFgLX1ySPw26rLTrxnVYf/OuJzTHmKbWuyYGPD3XI
         wYxH3Itw/XESA9KvTs7WICu38Fx7o+RF3P1ujBSmsEpT/D8vsrsXclONA0C6QlVaw+Cp
         Si9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704940; x=1773309740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=KnvgIITGlNbNb8X4QbdanM2UGYiICwtEnX8GsVBckvoOklsBuwYKP/W85uwQCcrDeb
         pvavSvstFofbKZhQvsXxvDy+UCpzdhZ4p8adEyHBFH2MXCbpsTV66jwT3MG+X0rVZ1mu
         WHC/9tHTOforwpET5D9+ey1JONvMIdtB3jBikKWuEuu6F9eL9aDEbsmp5IDzMWCYfWqi
         K20ffSqSp517g01p6cT1ssblpqqdnsyBId4bhvAOFmx2juekEwn9ZMEDtuA1OaIerHv5
         1OnJ2DcI8v7ulo7fCUwA+L5H90l9HRih4nsVYKbIMBWdqJa96LOSpOGc3giwIj4Mfi7+
         GSiA==
X-Forwarded-Encrypted: i=1; AJvYcCW34RUkITx9FjaYXWGOIhz5YuBVHymf+BVRMGwSWqEWjXa1qEtzNK4EnRDdCZ7FBTCjiX5g7FdjIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/wlWzFpjJ+qamQSKLJpLE/ICgdLajlxvBLbA63nhrKElyYgB6
	56eUkGdgBvA4pviyrlpWuisLtFoYmpWxtCjnuijhuOAqVPsvUWeI4jDNYgO3n3T7kcM=
X-Gm-Gg: ATEYQzwyew/3h33JJVBpFE/ZZzDSsKHEW+wXak8BPZPQKi15AzBUO0zItGaKz0UJ9D3
	QEktaEQ2g40UwjLPuDhFMynEdTaO8UPpBttfcKPD9gVLm7SphuVQeRpN4RZMs9hTZhtz1X0wGKj
	RtdOeY4gOYvtZEPTmhQUgB/ILiG/KQUgDWOO2go/UOEAaOmyMuZjqLCwAY+rxAlrzrdw94yINXk
	XLR7T8lnoYQkmBwLzRr6+FY1ErNjW9AfzN6GESsy+Q26f8aSodzsZYaIuVR0iZU31/z4zzK4edm
	mPpPifX2AC8SGJmlKFCUysMjV8x8AkM+PRjFRQLlAqjRPDKVoX4RLtENxTMe3vLKw4XLAeWWboc
	OWx4LD5f2TU7RwtaGecByOmf2tKuB/mu9oVCbp7cSxb9O+NpMmEj6Cn+6Fp9zWeLv3Uwf3ikQw8
	WfjUkr0PrnclmfBYY3VHCyFgqc9hsX
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4851988f31dmr86977045e9.23.1772704939633;
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Received: from salami.lan ([212.129.84.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fade9fdsm59453655e9.4.2026.03.05.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Message-ID: <030737fd255a49288349f06e8c1217a126ea9081.camel@linaro.org>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where
 missing
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>
Date: Thu, 05 Mar 2026 10:02:16 +0000
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-03-04 at 19:57 +0200, Vladimir Oltean wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>=20
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

> =C2=A0drivers/phy/phy-google-usb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +

For Google:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
