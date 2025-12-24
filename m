Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5928B4F0
	for <spacemit@lists.linux.dev>; Wed, 24 Dec 2025 02:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766544240; cv=none; b=S7qDovK0zsJ6dtBTNjFrXMq7qlG7UQpYsJBNT8PuSkpTXQdrHBP+Pg5V61CqkL5MIfflbgZyJXAZ3WF+czFpJdt5AJwwwtD7fxw8vrxzBgcoWIg1wWnlCWRGSmTYnRSBaipkXnkd6FrHJ+sqbLuXaBM2BKSfKsFfd9DxMDLd5s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766544240; c=relaxed/simple;
	bh=jVUap1/xHO9Yf5dIfNeKOwUCxn2VYFQJLond9gonYJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R5mJC302ckryxT6LGThHOKdQydK/nu/mIjxMp1Mz6gmo0BOMv6v4OiGRq+NBbT2EeMlYM5wDKSc56lnZ9VUj6eQNJVauE/zVd6N10J/AKdK6tSf+b9OKBDJXEa1ZEA6LSCUqM7r1NL2yu6bzF+JJ14oEhOUpx5w1ZczWUdUZQCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C8855341EB0;
	Wed, 24 Dec 2025 02:43:50 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	ziyao@disroot.org,
	aurelien@aurel32.net,
	johannes@erdfelt.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
Date: Wed, 24 Dec 2025 10:43:34 +0800
Message-ID: <176654417344.105270.15876939192797072148.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
References: <20251218151235.454997-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Dec 2025 09:12:26 -0600, Alex Elder wrote:
> This series introduces a PHY driver to support PCIe on the SpacemiT K1
> SoC.  The PCIe controller implementation is derived from a Synopsys
> DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
> PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
> lane, and the other two ports each have two lanes.  All PCIe ports
> operate at 5 GT/second.
> 
> [...]

Applied, thanks!

[4/5] riscv: dts: spacemit: Add a PCIe regulator
      https://github.com/spacemit-com/linux/commit/73a6c811fa0d07078c9e1eaecea76ce26fb5f10e
[5/5] riscv: dts: spacemit: PCIe and PHY-related updates
      https://github.com/spacemit-com/linux/commit/0be016a4b5d1b927de04e2e7a0a2bce51aacbfff

Best regards,
-- 
Yixun Lan

