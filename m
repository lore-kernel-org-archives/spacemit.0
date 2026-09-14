Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B99E477298
	for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399722; cv=none; b=LhrbY0Paz+pAlF0aLaqEExDeRFGEbXZ5MviDCoUOrbHLsXy5D1pXsf5/NMx6PnaO21rJkH4EXQeUmc1eNhzDjdECO1MerNGyKByLC/Z94AI/HiCx3pxAyGmwVgUmto0IX12sngpzaZgiziKr1umgy+WcTG/fnyt7F89DH6Vre/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399722; c=relaxed/simple;
	bh=/5GD500jhxrjrGdu3756syYeLWpVMCMPoBV0ibDiq+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IS+VgaOVdMVqdsmKAaqrCDoWwkst6mFX2gValyCmQb0sQRRnVlgj7cRnnDlNA9rNUnGOBOGrOFiNvP2Curb1RZ5ytwYiB/yYqsUzx4xnyga0pWjchAybmeQ5GENvHjOtrh9f1fXm4Vf5e1rfpnox2adm3LI6lR2vCMnkoCYSIPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVmCJZOO; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVmCJZOO"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2899628b3a.3
        for <spacemit@lists.linux.dev>; Mon, 14 Sep 2026 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399721; x=1790004521; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=TVmCJZOO9HLVLrXr42Pvhm1lWNvprEYUhyu7RN3Abu4NiubpVRdfAnDOq/eDfKjRCW
         2endip6dZQEWOdkHk21k7TPNfIy/NI/j3GIKob7Sd9ydtJOy/5iTH3wDk04vw3HBpxSD
         hfjwdcgVuuamr/L0pluNT/TmRc65hcazdiUeTYA223cjTjYaaK8touEicnWsNpMai0BM
         wpFWNHCuOanrA83DbOm+JDMLoM0ZKlUE+QGkD4F+Gszh7Owd8Y0l62sK/T5l78XTYkjT
         UUYBHJbVBrIml27V4wqPa+CxwkojYVUaKbxdfI5JbfVFbh/cOnXxxDsw6005XTWHFYNC
         3GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399721; x=1790004521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=NlFaROEreIDU/ttNOFsgovVkYvjZTUr7P0Z60+Q67HgxnIut3Y89AOmqpBWmc8+Vmm
         EZPKepw45/FNRYvtgIPBVWGwSgqFK+oZfcWet2byAcAVuiNOkeKPINSZGDhfill06Uga
         urJ/bMWqHaURpVeR/dI2TWaWofcGGAr5p6qWoym8E19Vw0giTviFb8DjOCUukjhalgod
         GCXpQDrBIT3ybXYe7EhumWkyh+r+N5HDgvO9TxXv0d1/uffQ1mT4fBu7pqCj/bZ3QcX5
         zF95opeJqCCB5ITMMri45Ly/F8/R4Fx0yHS89RdJG3HdxpqlkHPC1zvafY0xVxjy5o5H
         uYpQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+79II3qFgDiAOGFvgSkf3p84hRu2bAMY3+n7LlsLbCiB6ou9QFHPadifB0le3XT7iJ5Sqh2eWtg==@lists.linux.dev
X-Gm-Message-State: AFuF++noiyxTSz5945nPLYe8NbF2H6xEvjWJfSNAVZ89OkUV7DHr//U2
	LLBK9FilSk42vL+3IP4sZMTM2BKStW165wmtr/m3YDw15/YVTST2JnkR
X-Gm-Gg: AYBFou2EiY2huPn+jWBnOIZBjOBwFgzVT0zoGGUCBeryoRmvmqRGQSi1ZETJ0+1ydDp
	eM9e5rUDeVvcO62mfQSK+Eo+CAdOHgtPix8NkaKtGSi10GRJyVuIle4RCciU8v/MsGXq7ANDksS
	YfFnDAj8/MvjGb2+fgzm1UYH5CiBkO1w2Ax30+505buMfGJUH9mgI59Qo41NXK1/cX1zV7MDJmv
	g9ERMrPHhF0z9ucOwz+FgmikIb7YnVNJiayPlkdGm1HcVny6kV8G/9Cm+dETxmPV33EuMBZ4SnC
	JsH3GbDSLTCdF2oC8LkE8sE1zDi6bJ0AcB5RZWCRSy0oJ7lFxJ7wPea8A3a4sGlCx0X2DJF82QC
	1rcyjhqGH1KFmtZOgea9T+rMG6DF5uFOHuInv58Y2rfS6UltydDIlIJusSF9tWMJce9TKm3nEF1
	w/iCfeLy28+jElmf5ScfyjUbaNs5llnqlP+qugJg+xTSNKdmFi4dh+t+PW5ad3CeZiNTO0TUww3
	Vnp5AcfMtk5
X-Received: by 2002:a05:6a00:1797:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-86f865b48c2mr6631339b3a.26.1789399720794;
        Mon, 14 Sep 2026 08:28:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm4929479b3a.58.2026.09.14.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:28:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:28:38 -0700
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
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v5 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Message-ID: <db900549-54be-456e-9fae-5f04c69e7d1f@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-4-522def70acb4@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-4-522def70acb4@linux.dev>

On Mon, Sep 14, 2026 at 04:18:04PM +0800, Troy Mitchell wrote:
> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
> 
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
