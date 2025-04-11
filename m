Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E61320B7F1
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 22:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744411889; cv=none; b=hLfMPUlA7mc5Rc/vG1cmKfhTgevPW5ZSm7A29jTmR7mgXc2tsEyG2yTmvLPRFoR4e/KmQ1wRaHZI2XFQT/0svGEB3pDcq1EXyR/i+tQM2nZPcLNsEnpzDyGlTaLyppvt+d/I0DQuhLUQTq3Ndds3sF3IXTqFWXZjdLpuiQgfg6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744411889; c=relaxed/simple;
	bh=H2dEAfc/t00J965VIE7MUieNVqutIi14syjh4T7cAUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qd5V22/Iwa8mItXLz3HrRR7OdRCJjWKrUmJuyi/7roAKAnfEKsARtQLBL+yFRHVWO/cp4cMT3zJAmU46J/c8ynMVamPmaZyfeguNGmOV0sDEq5TA2R2xq4F3XhfN7DjmgnnlhqRO+M1TII0KALSsc0m8Od9YMIWXlMK4I7/7NUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaUECmj9; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaUECmj9"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c7913bab2cso244274985a.0
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 15:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744411887; x=1745016687; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HEQDjb5KDxAGEAba9XLVOTbfFbTRrFjtfkQU13uIchk=;
        b=AaUECmj9fiBUsPZRS5zYYxaTkaeMUIfefduUpoKzcqCH/j1LfMbhgt6hpFktDGIKii
         A3q654tshQckAdy2BLZ5zDcR7ue5beOxOf5bndYnpv66GfUbla5RlXS6we8suLxZvuKz
         De/HrANlbY7QQZLmWejauB4KZNCzfKQ/AuyPEssrbrtx1PY/UKg+m3D32HIwFihEnuUC
         Mljlquf13Ac5a7vv6BBzHBhzPAd1l08dx5owM0+7moBY9un3F1QgIv78R3jgg8neSIe5
         ap5NcwFp4HqlMXBmNQU3zq5ksRoNlJc+7HHukFABi8mkC1Qg8iQaoElXdtxlhuVJSWf+
         j7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744411887; x=1745016687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEQDjb5KDxAGEAba9XLVOTbfFbTRrFjtfkQU13uIchk=;
        b=UOMS8AgqqIEnfCUFZpxRTIYd+RQ767oCtlp64fnixE302awputT8h1Ycc46wXTsKxd
         /GWcgUlHDkYPfU1uO5NhwcIbSBvuFKrfMShUdaiLNfWZyX5PFU8/6ufVWprCVv/RW/EQ
         h+mZqqdQpsj0VIZJTzNjFKHc7aga51ENAcj57zDXJT+L24FOs5TIZYFL5uC+3zO+fCel
         gMR7BjiTu0r4aB1C4j4QF4DuH5usL8eYy54qDxkCW+ikzqAL6Db1wkxpjvMbY7GIzPv6
         c3njhM/RBDpNYJWr3WrMmd9vFtzorca6i39X5H0a2VOr6CjRjYfjv7+Pn/cnhhS91gk6
         Ajlw==
X-Forwarded-Encrypted: i=1; AJvYcCU6FgoFT1USisgjFEpWYXqnNg68GmBquhIFn3BdWoECpuU7ug9/plZ/KXWhYXYkutpf/xT2sMEn4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7/L8ATW/qn/1r1M4XzmO0OSadGCravL028XQZMQsPDiUKHqJu
	DEREY1C4katvd/kbKHeZbKVjLEQJyG/jVzVKa25i4I/qfbpwP5Gt
X-Gm-Gg: ASbGnctNyVTAUzqSGvxLdMAGR0BJdFPH9cqAr1X+ztrJTVZxqzPnSmOCwQGalMJQzKt
	obR+9vwnI68a7R+/qZ/Sy/xPS+w3H/kTK2jkQWyccykQ4E1nY7Z9DvsBEZwpLE6dX2s58Uk8zSE
	86IE6sbndfMFKimChp05CeyETtPgvRU75/M6/wSuov1DnelFkObn2lC2LXPoHkBUoJIC8VtP8tY
	S7HcpccQEiu0hqKMEFX5fy50kdJio+GM0Tf6haF1j8g2q5B2LOkibVBOYhAm67c+XxVTJhjo56Y
	xRsTaMJ48O7o0AJf
X-Google-Smtp-Source: AGHT+IGuYAfAK/ysb3ONfMtlfqBs3eOj3RFMg0gm7baoEe6QDUIz8+Gcn1rGlG9Y2X1CtFTB7l/gCw==
X-Received: by 2002:a05:620a:4399:b0:7c5:6396:f161 with SMTP id af79cd13be357-7c7af20ba80mr809021285a.49.1744411886951;
        Fri, 11 Apr 2025 15:51:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a895181csm322699285a.32.2025.04.11.15.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:51:26 -0700 (PDT)
Date: Sat, 12 Apr 2025 06:50:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH 6/9] riscv: dts: spacemit: Add pinctrl configurations for
 PWM0-PWM19
Message-ID: <ujkfb3ajvoebrkvoepztgh3afzw5dq7djefvdddiboo5gxu63x@dlflpzwpv26u>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-7-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411131423.3802611-7-guodong@riscstar.com>

On Fri, Apr 11, 2025 at 09:14:20PM +0800, Guodong Xu wrote:
> Add pinctrl configurations for PWM0 to PWM19 in the SpacemiT K1
> device tree source file. Each PWM instance is assigned multiple
> pinmux configurations corresponding to different GPIOs and
> function modes.
> 
> Configurations include:
> - Mapping GPIOs to appropriate pinctrl nodes for PWM functionality
> - Specifying bias-pull-up and drive-strength attributes
> 
> These updates ensure proper pin multiplexing and drive strength
> settings for PWM signals on the SpacemiT K1 SoC when selected.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 315 +++++++++++++++++++
>  1 file changed, 315 insertions(+)
> 

I think this is too much, I think it is necessary to leave
already used one.

Regards,
Inochi
