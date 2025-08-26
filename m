Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5938B350841
	for <spacemit@lists.linux.dev>; Tue, 26 Aug 2025 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216012; cv=none; b=mHWnaW8tDzOVZChLLq13eSwMLRos0OVT5vdr8H9J4LTQdZvRazHem3SR7D/YYDhg9c59r4YbDSQttfnK7jGsG9Lln+6Y7fRptQk4m46QTQkeryVf8or0cFRaJBjJ8NoYXsi/iwvdPXBWbfUqi91v4NM4gt6bRZLvsT9a3EuckzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216012; c=relaxed/simple;
	bh=jJUBEbotMJc4/7tNagC7dFAxP/nGnFXGjRAa45Uyr30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX+Tw3icoh0Fe3PJbgLZneynuWc9S7B/Yl0SQPimzlgedXXp+NsggcsMmAF8axlfQ3kix0ry8NrZnb0OMLl5VHJiw5YrOGwS0rNptq3q5a6tpsXEd+dAyZ84NV0JRPJdeGEobcPGmI7FUE2m05CR0u3vdwAa4Mu9jPnks7GyfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wobADlOt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wobADlOt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso45766915e9.0
        for <spacemit@lists.linux.dev>; Tue, 26 Aug 2025 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756216009; x=1756820809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bgIZihST00M2CtyLVGqxcGCSa4PCOhuFDLrOFCRzds=;
        b=wobADlOtNH/rUayyvpq0RMs+xnd5qa4xLdapD6irqENesNm4Gj1QTAnPHO/qkaiEBr
         5q+MxWgj1aptQOTzKej+SKtUl/dopuMyAU1PLxtS+i+zOlQ8bUohgATyaRsBQyvq/YqU
         jLj5pMn2rtCzKsCTztjsbmFJekGAweL4kL0UbWAHBRIqVi+LDFemuCBUiEVpf57p8WX+
         6u1u/7AGHcwqDeuWM8XxBauxtlpYMeFN0RPDdLafAceojo8Ddm505icEQkK8qbNeCb/M
         e5WrOLRuBlZJXjRk+66hL65Ct3mgp/0TheRF/OhDuvw6cm/vSOLYvqkKeqzeC3nfGTeL
         Br+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216009; x=1756820809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bgIZihST00M2CtyLVGqxcGCSa4PCOhuFDLrOFCRzds=;
        b=SFxoh3p/6nA4+9yVf16Ao39EDwXt6prIi8/BxEocs7xzTvENeJFT8/tV3ukdnvL6MD
         onRMaRnkZoKcEip1fBH3Zqp9cQIs5FFAYKB4oCoSX3QsDS8OY+dCORPUHlD7ywAYgOaE
         xTzdHTAoPrX6ES9uELJ5FEuNoybOQAsaWOUl88FgyTOmCexkLbZAg+4sMDIkVtQIaoUt
         a0y2o04X4U8DdfnHIphnYVDXrlY9O+kNi0X8Q1iIS4CnHekvrmeBxLVUUpXyBumVqOQs
         BAW+zpcNh51i/Yz//w9+bfB8/pggTcFVg0mFzT++eZC08W+hwp7mYPRCzOPLu7/3jsT5
         wnQA==
X-Forwarded-Encrypted: i=1; AJvYcCURyTzyOaDOC1JON9ZOz5nF95UZf+Q5r/OxBjQeSeCg0QGPBqgK8HsgyV/zje6MoLYK3/qydl8B1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0XnVXgBaRQzyBNv/16vrjdVZjuRnW+mydtASbpuJaNbmdUz4O
	XF6AE4XOOtKPch3fNpI5yD3T83ncAtKJUMySG16friG1ojQT7mCqGZxhlv5yrlZ+hET68WwoRm8
	WzZGR
X-Gm-Gg: ASbGncur+vXAbwDo1TtTeXnWZrpbZXiQKOXJ49C795roHiNTK/tRxsCBtc02jdJdwrI
	YVtTTlmOpS2n3nJdRHqR2NGWzF7sdtM2ikrK5EYsXqP15sNgCtW5uSoe62EWgCez/h4dfgnWtyL
	g2sFvCvRDoAWH0FnAngt7yJG57rncNGhm5CelE7jYnMl9V259vQKLwdK5jOpIKnYXVdeVaxH5f6
	8XqjfDzsx/QEI1UJMhJOlZefrWV1WN11PnBAEt92ytxo9kZZyaZzGUkbwpOHxqOF1Vv/QUAGyeT
	XrEwmb//fccSgZ8l7QJ+7oGjDzDFXs4vnfHW3nSJCtIxtdCikE2XxFbACSjuRxVthtFLPCbVBQ/
	1Seg/mZiDrYREdUTzgiwnoYgh
X-Google-Smtp-Source: AGHT+IH/vtben+jS8p+rxXWOqr702i8ga9ZchZdA6ANpXGCersQKl3QS+kocMs00UNNWRezs+Fzb3w==
X-Received: by 2002:a05:600c:190e:b0:459:e3f8:9308 with SMTP id 5b1f17b1804b1-45b517ad4bbmr141075015e9.11.1756216008734;
        Tue, 26 Aug 2025 06:46:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5b10sm16231162f8f.47.2025.08.26.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:46:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Date: Tue, 26 Aug 2025 15:46:46 +0200
Message-ID: <175621600512.33327.13991412012918423626.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 21 Aug 2025 10:32:14 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Minor whitespace cleanup in example
      https://git.kernel.org/brgl/linux/c/604642fc148b5d98fbe5f55e4c2688f9ee0b5868

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
