Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0486030FC33
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 00:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941093; cv=none; b=EDKm4sOxAzfqgvjwjfEkTr+zBieaFXen/CRs5hOh71EpYi99P63I4jKWg5zEOKbD7/O5z/nft07F0yuUgfi20Dhxrg48j/lffWUR/GFB32IWTQvamhNBZa1oYr2auyOStZLkWfmPSmKAX6yRYj+X+R1LvvFtrfaki2AIc3a7bQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941093; c=relaxed/simple;
	bh=kuTSarj9ZfJEd/4fshM2vXhKd0SE7Hs9HNHQbQ1dtwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oG0qdfNj+HtTj3Lv6lzhJr36+1oglLyk8ffvtK8UXbJNaZQbkrATvNDYMHpHaLTLFzJpCtjLEvNwXa6DT9tr/8ccz8i2tCTvID2Qfsl53Fxs0NQyXSMKr08425JWXwouXfioFf75QfoVxOMvtV7XVThshd2aDc54hYZU7lSSJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFIdcfci; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFIdcfci"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so1070486b3a.2
        for <spacemit@lists.linux.dev>; Fri, 24 Jul 2026 17:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941091; x=1785545891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3RPSKOAGTuMe7DirYFHsiGB/35uTeF1WdVdXjVBBsZg=;
        b=tFIdcfcissD07BWvPtrO5SrHHeIrORjIFFZO5lC8RbMI6wbZI6ChkXcbQSTC5jArZs
         Z/BK5EpUlKfUas0zgQ6TB6oNfdR53IN9GH6x0tgkq2HLiSZRq33AX3MmBEdx5IddEjEB
         hRrZVGJ4Yj8DrOUmyxouA8ENChW9tpPtR6i+IQjOsI89QcKozFqsqmjzHsQHdeX/Io8w
         H4GH8nyH7Dn/Eo3Q2pePshkd33z8LzVN/TVjP/QxE6k4A9kNmr1NmtfCqwBy5En7hGPP
         Id5h3af8Ld2d3hl3p503AIHPerqC5CYTv7MK2YKzhz5FTWtztRx7bMDNvcvLt/Jh3G4d
         DcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941091; x=1785545891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RPSKOAGTuMe7DirYFHsiGB/35uTeF1WdVdXjVBBsZg=;
        b=rLKMJC6BIO4Xvc7LIVx2SfFsxNt5yDTPGx9YzoUcyQjHC31QjP8QgNviNw9srodI0B
         +Qt6HSJHw+r1GQGMPUspNwBXWVAola3slvCkdw9S2eUk5xvmLTmRs31RV3zp7kc6HEZM
         XHNrXrBF6U8i08SMMBEhxH5EzOrI36y9v/+16VHgxZxfp8FOfH/oqxmxBD5XuhvrFML3
         4ZaZywcTvC/zcTJK3/IZ7P1Y5SVnoHs9HGdG2jE3gES3M2HNhorcqS2zGdnHF/XGHFa2
         8cFvYYJSvYGCgq3aN3I6QYv05w1RpQfichap2QSOZEcNTs3qxaSO2tZq7W3A3kaEeKHJ
         KynA==
X-Forwarded-Encrypted: i=1; AHgh+RpBBPWD1KZLOgd2ldqJZrDqUKGugv7Vqtsz6ECDADPPQHJuZaNV8J0vxcogimRRZbRzq7NOw6xqGA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi2/4aFAYuSMoLeQ1wCRHBaBuoxs5ARKUzdpvoNCyE5IjIeDed
	iBiwnyOVwE0hkb2DeQUJZVh1GICkiTymhRTriEj4vn5NEIYlG72WjqRU
X-Gm-Gg: AR+sD111enmosFC4QxLdjhq+GNwXQOOgRf2eL+XgKvyGIFB1ADGDnurclkz/h1U+GFP
	0Ll/DD4w9HjCcCgvFjLV5tkKqjdoVugK1PTprVSTXiJrX0eRB1G53ApiusZNcbA+FgzpSJX5oKK
	CSCSCxa9LRYc5C1v+cM0UBM5j7l3NyZjFXOGA0C2n9kP++ZgL0KAXRH9L/ctI0BLVNvyoJ7Xb4S
	7raaCxONf70LalBL/6Ai+L5ZtXxz14qFcdOMmitilxIuMr2OrE299eYv2DjEUuLSCunte0NQh/s
	DgkZCU8uxMNEj/KnAP+LFqHMYyxfCDPm7aAQEQsVscloaB9p1TNq5EOSev+m3BDOkDH0MhhMy14
	3Ykph77ejbP9ByW/xex+fDkvTf93YJIVbCHbXuGDAMPSp4W5XZ5plMpVSUtpcMLxI3YF2B7vU
X-Received: by 2002:a05:6a00:4c07:b0:847:df4c:40c9 with SMTP id d2e1a72fcca58-84e595543b9mr406839b3a.46.1784941091167;
        Fri, 24 Jul 2026 17:58:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53254f57sm566254b3a.1.2026.07.24.17.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Date: Sat, 25 Jul 2026 08:58:01 +0800
Message-ID: <20260725005804.373698-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported, the phy framework can not detected the phy id correctly
when reiniting this. So add the phy id compatible string to the
etherenet phy, so the phy can be reinit successfully.

Note: separate this patchset as two patch for backport if necessary.

Inochi Amaoto (2):
  riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
  riscv: dts: spacemit: Fix phy id check for the phy on com260 board

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 3 ++-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

--
2.55.0

