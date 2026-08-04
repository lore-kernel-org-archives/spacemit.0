Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8334D43E06B
	for <spacemit@lists.linux.dev>; Tue,  4 Aug 2026 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850362; cv=none; b=COqSyWyKf9IJP9Pj+oRDjM6+XHJWy5GVfpxdBPnSx0yrbv5yXY0wM+dSDxMJTVOUvyoay0UrdPaW3SRqESqxvXFuq/lvg37EL8PWLKvYR43/23+43LnYegfS8hVa10EDQtJoh70qfHmLTbhBi5q2c7x2/jlrJS+en9F6MVyAPXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850362; c=relaxed/simple;
	bh=S7uc9JGdxOwR1bdhe/OsfcOzAKJ8rWbmIrOkJ5ul6x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u7M58S/SMPb4cXB9x9YLvuVqCE8w+9PyQ6Semrjl6ubqER5PaRsVYAI+qfNJ9baajPPh4w6cDBiGE2YpYCJ3djnL1YjtjdKYgxhHgys9Vt0eIBJCPUpOiy3r8W4WGoawgjuP2eRVql0X5QtYQChjzKXyLWtWW4T6jGI1mGX9mjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR5BP8Ds; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR5BP8Ds"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49558ce01afso25328855e9.1
        for <spacemit@lists.linux.dev>; Tue, 04 Aug 2026 06:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785850359; x=1786455159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LnS+ToAVs8VPBevN/ktqdqEpqgN1qgKy4u1VdvZUrps=;
        b=fR5BP8Ds3b9jbF1BBezBxxn1Dd4U52cTiv0Di1PXYSAGlJETiIyCRcF8sL2RC1S+yM
         dODbtgq82J4zHyEGm6x4k1uKCq5QBXxmDLdQ2UGWt782LzE158iQm0BBoMU6d7yCDnjb
         1gI6diFKLMB02iQ9KDLGBaibDjQ+4/yH43S4QAacP0CL0+hzhRBfK18B6u44LLzhh0Rd
         0y0Hr5xBLuvIYlzFt5nDtigtBpXwqkHjCj48zKiTmXAVonNaQShkmnG8L9VFLV3+MjM9
         XK3+6jnsmoSKhpyhZ+pMouaab3zqhgei4/P4tGoO04ADc5fpzP5o4pIrZfvRfiB52Ha1
         /qtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850359; x=1786455159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LnS+ToAVs8VPBevN/ktqdqEpqgN1qgKy4u1VdvZUrps=;
        b=EsJgxms9DFyWbM7fEuIIh8uRq1JcnrCJu8+xWApUjY/trBdtKuY3PXqrmBH99DIcN4
         cN1MekgjpHEZYsID60DBYGwAvGRtHFLC19rp5s+4PU19eT3h3mHSPl/lTOPU3GMHMExj
         sp3/TWwCNxjQ+soebLqHxRtgBhw++Dzk0pn74OYMhOE4k4wWsmImBWRDh4vCr7++8TeF
         dzeYi6InXdJFEEibu1JeTI+AE9BIrFQWduZIQ3IJkZU3TzGFW7hBXNcfgDxmPMex8f6z
         vzbxeHxP3nl7HBpM+uekEhtE3bJf3WN7BbYWiUX2ajtBRJdSBqaegen/MdDp7hoqSMnl
         x9Ag==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Y/oX5P1BNnQJteBCTE7iiJZIEX9gAsJVMncUfX1TbnODxJeTcFufaS/9cyJdfgGoDLRSsdYLIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxH0cB5nhq6d4JZfBV4GCBocXq3jXl/jOpLI+kVpNrPlyvKOMPR
	4oMA4Vi49i6KisG/pfoSM+OLprdmtN/FzuofOFJlvXmMsOqwUMfMic3eqVy0Fw==
X-Gm-Gg: AR+sD12yIkvQCwSWzvbhBSieXV5l6CfL9e0yk6B73W597l/mjUMvgo18yE8OVvnCaII
	InK+PJY7/bQDb86zO7kzaUlJTdkU4ggk1JW8XM7LCFosTPuD2u0nu2Die1M+Q6lnUXMw9L6BO4j
	7f8O/ieDAnTKG8jEJovaQ4nDNhO2uKxVzEXRKzWP8VJqeU2CG2NprsaO6G4hOX2H2hoD0ggskK/
	WZGZfl/fqCs6ZR77BjvjM1lo4WiFv5jvOyjHv1x/IW75J+7qtY1EiNcR0DKkndAnkfYgzNvLSsp
	YpqjqvKXwDJ1pvTAl4ixVix2Fp8UDVPyJ0LKnKTljDRE6KT+gTolXq5kIR7nNxNfTZ4TE5sK3bH
	GCJHdbF92WwDSwAGLCF0ZAEx2uwebVXNmc8kfS6R5mpRBBqNuGqDWZXTeUxxo8MIcdcWSm9fumJ
	Z5d24CHFPUgodtBDzS+gzE/HXSOMDlYNiqtuqWfaKy5QrVguckLp+H12qt9dakKqeGp54kdeYnt
	7GUo7f6KoIbv4T88SixjfV22uA9ay4Wu2ICoJmZnA==
X-Received: by 2002:a05:600c:a45:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4980c66d8a5mr291501805e9.5.1785850358389;
        Tue, 04 Aug 2026 06:32:38 -0700 (PDT)
Received: from mamamia.internal (a89-182-139-70.net-htp.de. [89.182.139.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7bf4sm88037735e9.11.2026.08.04.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:32:37 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
Date: Tue,  4 Aug 2026 15:32:31 +0200
Message-ID: <20260804133236.205668-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds cpu scaling for 3 boards, each authored and tested by a
community member on their device:

- k1-musepi-pro
  fixed include order  
  v1: https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/

- orangepi-rv2
  unchanged, included here because it's still unmerged, probably just
  fell through the cracks
  v2: https://lore.kernel.org/spacemit/20260615-k1-cpufreq-orangepi-rv2-v2-1-237f006e580b@gmail.com/

- k1-orangepi-r2s
  new patch from Vincent, cc'ed
  origin: https://github.com/dhewg/openwrt/pull/3

Andre Heider (1):
  riscv: dts: spacemit: k1-musepi-pro: add cpu scaling

Jonatan Hazell (1):
  riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC

Vincent Legoll (1):
  riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC

 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 35 ++++++++++++++++++-
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 35 ++++++++++++++++++-
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 35 ++++++++++++++++++-
 3 files changed, 102 insertions(+), 3 deletions(-)

-- 
2.53.0

