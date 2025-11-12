Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225322F9D94
	for <spacemit@lists.linux.dev>; Wed, 12 Nov 2025 10:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943798; cv=none; b=vEswM+XYbe+GCXw+UX0r7p/ZUca5qAGrur8EU5GNOQJJ30gjIMk0ZB+9GaVh2bRTlFMYA1uGsNL17OEG/JX+9sbC5ajejE7827P/aFsp8IlPfJv8CDD14CiD5HxkktEDeLf6XhxUjVurtbswTR0PP47QBnPV0jRKY9MryvMCbck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943798; c=relaxed/simple;
	bh=Da49LH9vc7PHEWJQa5X8y9W/+DOqC+/L8y0ZpZRCTew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OAzAK+wumr0bgz9obpqSO8EBNsJU+3L1lZ4L5GBpKS8eOT/yLaKiSVKjPBQ9PJpmvFjEqXHk22WZjlArY4/D2COc5S5iSoRy+0Sb6VjfmNOz8wGDTwSbRlG6uOGH3M9hq7UiTQYkNCi3fYKuUDVeoJuyJXkGgiPHP3+sJ60P2U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BBB72340BEF;
	Wed, 12 Nov 2025 10:36:33 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	michael.opdenacker@rootcommit.com
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4 0/2] riscv: spacemit: initial support for OrangePi R2S
Date: Wed, 12 Nov 2025 18:36:25 +0800
Message-ID: <176294344891.286285.2166158383229687355.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
References: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Nov 2025 04:44:40 +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> This adds initial support for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is identical in die
> and package to the SpacemiT K1 SoC [2].
> 
> What makes this board attractive is its 4 Ethernet ports
> (2 x Gigagit RGMII with an external Motorcomm YT8531C PHY,
> and 2 x 2.5 Gigabit Ethernet with RTL8125BG on an internal
> PCI Express bus), its small form factor and its attractive
> pricing like other OrangePi boards.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S board
      https://github.com/spacemit-com/linux/commit/323256d11e01d5ee2a0a2e7b682890498b90b212
[2/2] riscv: dts: spacemit: Add OrangePi R2S board device tree
      https://github.com/spacemit-com/linux/commit/63e572b11464a233f45ad469ba64b8b9e68a9cd1

Best regards,
-- 
Yixun Lan

