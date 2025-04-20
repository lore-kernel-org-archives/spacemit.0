Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DCA1D63D3
	for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132757; cv=none; b=n1pIPQu3aIzHpOmzbLRQZV96BfUPQ2eJaXyNPgcHhww5FfhRJD+GNJP03hMdUNExqUNjNG7NcvfxiJ7nyRjLIt2k3UOK1wJK3XXREkcssZTd9Svct9ofY8JXgvSVlApUZsD8D9OuxnPGgd/vi03c0hz2biqYSZMQKAX/qLMUMoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132757; c=relaxed/simple;
	bh=naU+Nm6I+OWCRU692DlZpNGwp9uIvhKLLXB6jext1Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYBGKeOVyY/V8D+azyL3ItHJB7y/R/B/h31in18VZdd4cXaWTfXonq5ZzCDCa1cMGHzUS4pinqyx34lkU3hj8lXZN26RbSJ/4/jyz65yqGt/QsCHlYfZKUMO8K8yWMBcSETKVgpCbt3XmUlcoWou4KsyQV2KxGBNR1+bP7hUhmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=R0whXVYk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="R0whXVYk"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b350a22cso2485359b3a.1
        for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132755; x=1745737555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82p2hGF43l3nHL3xd1lQgBU5B0CP4KmhX25rKqULFWk=;
        b=R0whXVYkFt6XHPoDq945TAmovyEK/ebov99VGJtxzfVRXDB1+en4XWIRaR1gC2vxmD
         +jBAbdzWknAfz/Y8lCGO/2X0/rEQentocAMNVLY0qSrYL/YWdQI5qkfAfx3kGzsOX2Jm
         jZNBM9y+S7ay8LDlylilKMQyi0CmQe488iBJSpyWTjRN0CCV/XMdeaBtLBLvKDSIP7bt
         dvGNJNpx9y25hoz3EQGe9Z0rc1Ty/RZYRe0DWWvLveL99k9oDPhQHphkn5gmRpfOOq0R
         7rd/KWu2Dy9bYNwlLqjzw4yWbWhtpzLXmkMlhkf+GVKSMk2x3ZC498rW0FoDwtVk9sHr
         N3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132755; x=1745737555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82p2hGF43l3nHL3xd1lQgBU5B0CP4KmhX25rKqULFWk=;
        b=F+q5RaM1haVF5Wg0nIi0ekQmMcR4Y03yW/PzXOwgfqD+ZFJfyjxf3BOiObRFrz2KQw
         OxqZ4/kpCLXdJkBNwb5DF8Q3HUUNtp9QxEwyQ/ShYIKMWwzFnkxAiBYyAzHgObvqOoJY
         Jg5bWFP2O4fp8+ijJMvYoqrewwU5ogIU7E+Do5q7i+uKgOB0vx6MwyucQItRw+VowNFw
         A9u0gFSbTBu4KFQtieNJMtGEIODp/J5sgnE1Tpl6mOJYLl76EXTA04585PCPau4Rdh5r
         AavJN9cFTUpJi3wSK14SDuWzXt8xxo+YGwZB4ooTKcx7df05W2VMrlV2VC4I30vJz/3F
         bTwg==
X-Forwarded-Encrypted: i=1; AJvYcCUydaPpIFnWV81JKgeSo4EhT43O8z+ZWFN1q5WxFbSgSpHnaQbRA1mSQ+8G2KuWemVC0X8NiJ6png==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwfid+oex4AZUVUGLfapPb8OtPKpEw4MPzyavTKsBwPExrp0a2
	gD2x3WJOgPkyADJFPs4+iWsiaN91k7YRQlkzmY7AEbPKOQCvzScg2uq44kL/1Fo=
X-Gm-Gg: ASbGncuVmA0O2zoj9krwm6oXAzVlUPDBjrdBTUtKwWzlZNngRP6rtWSNdBtyFY5rBLU
	f3IOvC/0rOlBFjcJHsS8jb0shstCsmU8YlU94KxVrTnz3VusFsLfoEWku92pYIDjHhVQppKhAa7
	LYW8F2WREfE8AdjL7xb7OBnAzA1EFe60Li765bhK9AHNzrjkDRlsIfwrNAvY88BsOyBLCZW7+Pg
	G8k3UtbqOJuz0OTxNvkdREdFeuNqvUvttPgAkwbZQYhkKNxDPQXwqSKqIG7su3kgZIMjR8EiUaW
	ACfT3wiyw5n/OhL0lcX2haVabUCJuw==
X-Google-Smtp-Source: AGHT+IGlKkNRMGUbwKmTBceKff072Fm/DzOacdnjFvDMw7BvjtUfzlAQ7rY/VZVOV3UNRwKeqrDsWw==
X-Received: by 2002:a05:6a20:6f92:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-203cbc75495mr11575555637.25.1745132754866;
        Sun, 20 Apr 2025 00:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 5/6] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Sun, 20 Apr 2025 15:02:50 +0800
Message-ID: <20250420070251.378950-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC uses PWM_PXA driver.

Update the Kconfig file for the PWM_PXA driver to allow
the SpacemiT K1 SoC to use it.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change

 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4731d5b90d7e..6731669e724e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -493,7 +493,7 @@ config PWM_PCA9685
 
 config PWM_PXA
 	tristate "PXA PWM support"
-	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
+	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Generic PWM framework driver for PXA.
-- 
2.43.0

