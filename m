Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB73932E9
	for <spacemit@lists.linux.dev>; Thu,  9 Jul 2026 04:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569899; cv=none; b=r7JU59EKfG3wYFNno0vbo6itxKlUFA8Dog899sm86OttgWk4uCHKg5h4LUoboU/YvVNY92cwCFiUaAAXwL/PrHs/DpRSAqNtKszHqfuoeAoki76VJSE7SHzwSZi+zREG9Q0qibqE2yGMNQWUjyyRYzC4ZArdKZDFYH5jwBuhQV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569899; c=relaxed/simple;
	bh=kUdfv9pXRhZ7eoJfyNGXuA12xBzld75C2LrAs7JoSgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O1+nFE50ydmCQPqfsJZrgBpw7nO1TzmEdXiP/0IonX9s5i14Lm66ngMu55jzC5BLEfmvk6KfrVDPPFJC/GenbP9RPDsYo+45Ci1x+fH8ZSlAUJCnIfVaqyQxZD7/C8FMzrsQB9UbWD+o9QZd9QpzqBlihPzGjZgYj0TrZfzIwi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e20+ocQs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e20+ocQs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad4170e8eso4989155ad.3
        for <spacemit@lists.linux.dev>; Wed, 08 Jul 2026 21:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569897; x=1784174697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEHsI3+JCKB2EiJ/RAuGzgvkVrODmXwkkeIiIkxzRKw=;
        b=e20+ocQsYASVzrCIYA75WnZxRR7I3uW2ip08VLdvq+UvYpmVtShpuSULTpm0x6xIc2
         PwEDK2VBl+tDee4YSLm/DYwRiG1WZ+Vy7w41gWMHc0Z9d3uiXcU9/949EGsSV8hCWcrq
         uDus/exGdp5OEk93SeMKL2uMgtRMbNLiUNh2DMPNoz1RwJEDERQLWQi6PzMyT/zPIu/i
         34ta+WvskSgVcJepTNhdAmQU/UfMdSfjPwVb5AXmcnuneZuIs3w5uaIqWurXcmpI1Lvr
         pszDe4/h8Yvfc7zdeaHM5X7Rysbh4Q7rFIqmy9mwGsdd+vAAoQhj0GEomxJbUXJe2ikK
         J62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569897; x=1784174697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEHsI3+JCKB2EiJ/RAuGzgvkVrODmXwkkeIiIkxzRKw=;
        b=EIFYtLeXEP6+3kF4iQKX21F5VuEV/Sr7lyXJUVy6gHbM4Ux2OVMpBGkcsRGMkPxyN/
         3MH6lK7mo4WFHhe0SgLhcy7kU2t2RDUedwDvqWbXDLiFPuqs1PqqpwsDi1uls5NJuIPy
         WR2fuQ9W8LHEc3EAs72oxiguVnqNUmijeNGN5PJriPtTi54vXrlVYdPuTdf3rNx3qUaH
         UDgxyeotnQBW+jxLEN7dJdIzmX/bem4XRz6zaTaK8sSUDu3hpn+5H24RNjrd7mBRStQp
         qYBXeRRygjc7lmLOfsB2c0sj4DPuwcD2UJPCFnkEVRwjjiap5P72ciyDFruSEOu+5D+5
         urbg==
X-Forwarded-Encrypted: i=1; AHgh+Rqhpl1OemViTfqxqnrq3dbgeVbutazwDnq6/DolB+5468kwbzt58XZaGAqmAjalnj4O/Z2T5ZySTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh3RbbCCmK0nMtkoc6RBTrzOhQNaej20xtGy3iCLEl5lX36Cxv
	Elp6ydS1pvpq5WKQUHGGwMgaOZ5dYtXLTzyAub2ZuGK4S0qSPyanLRD2bFwIdWKI
X-Gm-Gg: AfdE7cmUSOlAGUWtn8W8U+1p9aE+LLHBoTmMr7iJK9PQFWuXFPw9er0Yx0kamJkt3Cv
	Fim0h8bBgMUVSNs0EZsJV3OgCBG7YKfyVHLcLDX/05vMYMcYVoRKJoFebdrmIXiM8ZzEUtFFZk/
	d7x8TZl7JknbIOG7LdtazVjZF4FoI8D6unnTNHfWguYsY3pe7R0DaUyhKHIa3QlryBOlE1Poyz0
	09fMYjfFdG0lgVOYi7mB+ouNfPGIHavJoyKvje8F61TFN5n+581rA0Td1DvtdaesEJrgT9WfhQC
	BZ0HrqizUYhICTNAVrovbRtjcP8gX27ybFBVJrVwYQwDvqE+apmGWELYPzP+GcX2rZAZiigE4NA
	OjVNE0wMkSQvfhaksFnZEAVAJoqFCcKYLQ2vIRSjzNxxHxy0Jr+GCmw6Lk+IEv9IH
X-Received: by 2002:a17:902:cec2:b0:2cc:9179:32e with SMTP id d9443c01a7336-2ccea37df94mr58757875ad.10.1783569896614;
        Wed, 08 Jul 2026 21:04:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb72fsm36569815ad.6.2026.07.08.21.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:04:56 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Thu,  9 Jul 2026 12:04:12 +0800
Message-ID: <20260709040415.977784-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS for series:
https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com

Inochi Amaoto (2):
  riscv: dts: spacemit: k3: add USB controller and USB phy support
  riscv: dts: spacemit: k3: Add PCIe device node

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  51 ++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi |  33 +++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 237 +++++++++++++++++++
 3 files changed, 321 insertions(+)

--
2.55.0

