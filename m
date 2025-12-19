Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D1D2C234A
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766130154; cv=none; b=E1UCV/ULn0Xg3LDt15NVP+GcolvbVg/5WuKTg5/34FT4vpnYSSDc/o+Ppu7Cixx28ehexGLbXWUAXpl9XxrPNCEztbSNc1UWKjnEw2RCwFhD53DgucmmIop6ZwTI24YiU7BSekDjyDaE8mlwsIOWq7e2556ONLGfspI9f62/y+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766130154; c=relaxed/simple;
	bh=qNd7Kkg/H2zhSsCmeKqv5XE2BPxplo29/JW30z7IwFc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hnpsUZ3lyCSF3FeXnDPqYzi87T2MVbRK7WEFRy+q78jhuxB5zLXf+1ELqiv1UIRttvYBwhNaiPBVukEJm3la3ks6TruS1Yg6npZ0ua8Daydw5aiasNBI20HxZeQ61f3TboKIYbN8k3zzxwzkGs3v6FoD2BKfLDDD/HjUWP0j/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hc954rAW; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hc954rAW"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1177504b3a.1
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 23:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766130152; x=1766734952; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGrTuvEwjjViNUMt3QJcRhb16ogXp7GtzCI+L0Kabag=;
        b=hc954rAWtbADHiOwCCIP2b+qeGBnmYZvbVoY0xUrda0N1brE3CSVg4OoWQYw//g9Fz
         yJsaMrB6lJOZpiexWvuEbz2ZerL1QrI+bY9CI2G4T1CbBJb7JgGVClqdkPcJW+IksDIY
         4yfwVY2L6/H37MbqzmAXjycZlOl9gEeHFOLUn9wOrb7c4Aaxo2sD7B5FIJ8mrBu5UJXp
         xOd2gWLdP8Tzd64HxeagcBQPubsAgN0viMCItPrV/Vcn1webGEYlmSLSE6XzjDw8Hfyq
         bgJNpJRDBf6r80fxTarILTQ/I4B+2JUQtwmzMtiQcpbKpMGBt7accMfI1JUtViGgC0DT
         Sh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766130152; x=1766734952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGrTuvEwjjViNUMt3QJcRhb16ogXp7GtzCI+L0Kabag=;
        b=d7kKk00+xCTcHr2xb14Pi529ZYdXycn6DyqX9pd+wymB+zoy7paicpmrJiDymLxU7L
         yVUhZN+OJ/wQY6uG/d1bF5LdlSpyOuO8lymZz/VPpYhlpZSqFqioBloton762szxqgZP
         hKu8sHNn41O4pXKNrFwPtmlfjlu/k8loAJgQpZ2pCiT+bU2B2EK8oRCqDpc/W6cUNuST
         CAHVy1UDFdo/gvnzv1KR79xT24RJkpinDF9KgIbe9U/gcxGM6M27ECOfyhbJMneBqOhI
         hAvMMiNoGlZj9K3feV5EOoMTiynyKaV0y18cS0e0/mOkA28XcchffufjlklSEE+0w14j
         tpNw==
X-Forwarded-Encrypted: i=1; AJvYcCUTDAkFKZCnLN8EMU1cBKrP5ONKoMaNUbplJjSL6zbjWNAJaogjhPDmeL/+IHuMA26/+YYrJFW5QA==@lists.linux.dev
X-Gm-Message-State: AOJu0YymumvCKJMMNqr6jxbG9NAqtW3wPqY1IbAF29V4xTNcKx98gds8
	IubE9z8K1ubSHn5qDH7Z4K25pf521By4fgJjJ1RUM2J0DFHK+Ktp28cu
X-Gm-Gg: AY/fxX6Na1bfz0KEMk3tyBlEK+48xz5RUkJdyBpTAhDJ/LjPTA3on0K/5gA2GJTRXIM
	fTdHCn02iwn/C48A6+jZTLGLRNgnpkqXcDlxs++328stUkq6Qef+j+xMaawqPq/8bd1dZi2p/xn
	NMdSIGj9cSh9wrf3wp4J7ooUADwa7QwhijNicasYqDfJSxdbLXdzUFFAB/OOSfqAkvnoygJdgNd
	Ms35/6XkEXl3UQg39f+UmTt5x7zkahbL5an5bJh0xTU26QzwlSqmeOzBaaCaGIUdKAF/NeGntLU
	7RU/I3VS/A5ZGAEI9hFpcWBgopMQKBCyfCRGVw/TQDSjdIT49RExaw76NmRqGMfXzS4LQQGpufj
	9Fmda2hlidHAlo3anYg3E0AnudOus3vZ6LZE2Kt72olLCCWJH5g9Q
X-Google-Smtp-Source: AGHT+IHvlxajrZyvgu5NAl/VwkuEOt/upecy4ZBkpxVWB19Jg5A5qRKqAiwdH54bqOmcRQaHwjRFZg==
X-Received: by 2002:a05:6a00:2995:b0:7e8:4587:e8bf with SMTP id d2e1a72fcca58-7ff664798e5mr1631925b3a.50.1766130152282;
        Thu, 18 Dec 2025 23:42:32 -0800 (PST)
Received: from localhost ([221.192.179.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm1489676b3a.50.2025.12.18.23.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 23:42:31 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH v2 0/3] i2c: spacemit: add reset support
Date: Fri, 19 Dec 2025 15:42:19 +0800
Message-Id: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsBRWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDI0ML3UyjZN2i1OLUEt1E86RUQ2NLI0PjlFQloPqCotS0zAqwWdGxtbU
 Ao4A1YFsAAAA=
X-Change-ID: 20251218-i2c-reset-a7be139213de
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766130147; l=1131;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=qNd7Kkg/H2zhSsCmeKqv5XE2BPxplo29/JW30z7IwFc=;
 b=IP9PYiLnxh4jarsPPV3BBgqvdAZV84EWSlqmOsx0gleAv9VAbPkrnmv1JaYOb/jF/whJbat21
 mM7tks7h+8dDHF63uWqww3whwCH//d9Myr1eKBAj41dpiIhog/DiS+4
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=

Add reset support for the K1 I2C driver. A reset ensures that the
controller starts in a clean and known state.

Reset ensures that the I2C hardware is in a clean state. We cannot assume
that no program used I2C before the kernel booted.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Changes in v2:
- Replace reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v1: https://lore.kernel.org/r/20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com

---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       | 8 ++++++++
 drivers/i2c/busses/i2c-k1.c                                | 7 +++++++
 3 files changed, 18 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-i2c-reset-a7be139213de

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>

