Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB31A316B
	for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377402; cv=none; b=CPvjfKVmxZL1LHKNry0VpYlkse0iStlJjbzZiYhdtX8UoOW+1+6rPNOdBB/Kzqw5HcMYPO3/rsqf+jOyQSQhmOCliiu87WWBTNiclD0Czbe+DtyhLrYbmAwe0tqVWqXGShHJU39CrT9hDXY4jb5vj9U5yqDxOJBo09fRbttcpa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377402; c=relaxed/simple;
	bh=6n3VL3xR2NW+WiuR1BgpROds4O7/ouFUZ1fFJBmsbDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhyP7vuR6mfelviVhmcbcIhImYG8KIa00Hu3jIWMcPvYtz8mB49sednpfWy9Nu7Ct96neT5YcQcTT2soTokrcm2KlKxqD8+nLEPcU9+9gJvxuLUFdazGoqdSKK1EvDyahkGg7uQP5VQSw8hEk7pGf/Yd+jVRCfz5uMV7nwBYScc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ii9ecrNY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ii9ecrNY"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224171d6826so28169485ad.3
        for <spacemit@lists.linux.dev>; Fri, 11 Apr 2025 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377398; x=1744982198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63RGI1NwLEiYAeH/RFKeArdRDE2NQgX8WQsa8ntLKY4=;
        b=ii9ecrNY1yRZJ0TkHSv3zVSErwwsFJPxUqE7FjWeGEDer5eNI8CUsMWPFpWcOeRFiv
         MquP5ewcnrdQ3gmV2AzH8rQTYpsGl9QyUOm9j8cGDwtC8VFlz3O2dt0mQxm/XIyuLCbm
         /qCjz/6g+2zPKUVA9dyWo0NIOxBrBZUijqxu+OP9M7bre+BEL1CPYalPU/+w67zerW6Z
         ea8qwVzooNZxTzbHZjfrSppRer/PY+bWEwuf+7lfWCjrWaZ+zT1aHMTrZG785T66MdCw
         cWyL8o5hGQaBJx2TVv3pySnObwT56Ko4FR3WUqESHfNncLc6zgeYc/srm4UzZQO31QIb
         I4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377398; x=1744982198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63RGI1NwLEiYAeH/RFKeArdRDE2NQgX8WQsa8ntLKY4=;
        b=isEol8D1ZuRzM40iW6IwzeRvSvWzZImv5B4ZbJlvroLZ1BGW11NwrioW+2dq56lyKU
         9p1hOeuLNCJnZtvrw5Ja6OoX+EpDtHjkVwnEavz8yw1pC7jcDPvyv5Hhy+8YRfqjXxee
         yLTw00sNNHMwgce+1qYX1WonS5PaV0iF7PxUrja2/6cna0QJ9Rd41UnYKdEjfURf6Tww
         2fStFKL8c+KaKHFoZsp/d/n+qf1eWLqbQEfiiqoewZrgmW0eQDw9qM8SQCgWuxpUVdg+
         B5GQqlBjDWR8odtJ9w27SdIEbQNwNw0vQefwsGWeVX/earx6Tf0FGEo8Qk8XfRbyR4oy
         ojuw==
X-Forwarded-Encrypted: i=1; AJvYcCWEPt9+gKJgcHOyhZbAD38jRX2wQjJeIfyP747StiB9XFJLQgtbJxlQXQvC1UdPnOIKwpqD6FmFbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBpPHj6rpwerLLOX4GpnqRC0RUTTyWG/FdwN0zmCoDeDTOoU7R
	4FBsDFQuf0aerQzb1/IwE/dCtZ91RxpGIvNsZSfeVN5wouKajQUDnIEGgjQRp0s=
X-Gm-Gg: ASbGncuin7Qv8OVS+GmAj9Zl4EgZFoYTm0t9N6CynG77E2GcsAFkRYhkJNp6rulkU4M
	J8ZV+IiWOjV27+6K1Tu/WTZ4dTU5sYyM6jmZDhdYeNktTleCGWy/wP28qDlqljWDjve+LnrN0VS
	rOzwIMXvnMhsTVEEM1T3aN7YSnqPqF572SlpGXy8TjJ1Y1Jitfm5F2nUcsrDLjSxhL+m9jUFgiR
	rJ3PFKDC0rovnjYGtstM8kDHuMNqFL+nEX6GkQU1QzedyJvZHJ4nFRZAg2BRkomMgOrFiAFTVYc
	FgG3/63StSQX1RdJfXctxJ4dfBkOeY8=
X-Google-Smtp-Source: AGHT+IGdBpii9FqwXTM5hJBzhslBNKfg5Cs2FGnvGr9Q17Wy0FzzwX5fnWry21A6oGkbvSxeOYahLg==
X-Received: by 2002:a17:902:db0d:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22bea4ffb4cmr33239005ad.42.1744377398297;
        Fri, 11 Apr 2025 06:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:37 -0700 (PDT)
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
	spacemit@lists.linux.dev
Subject: [PATCH 8/9] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Fri, 11 Apr 2025 21:14:22 +0800
Message-ID: <20250411131423.3802611-9-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
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

