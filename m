Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F73C334C24
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767958640; cv=none; b=o90UzZlHb7UbPEEOrCP/p5LhpcnbEJLj9hOgb9J5K3zAMmAfLY8V0hfr8KCrxl038lLWnbDnb2v9kmaCZGKbeBR/q5zoItwqduXtZsPmzKmhXJ+FbCLM/VZMVqIj5zKCCyyB1R2bdwr2PoU4Qkb/1+Dufp/y6/u3Mh4EAhBQaDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767958640; c=relaxed/simple;
	bh=nEyxjMarQSRarEps9UxEFDTiwLAyRCJO8V+4Tjn5NJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HwjfoiK6DnVlzh9CcJk85tDtQ6nf8W92rEvKvdGGU6cJpqbQHwjwnAezHrfwVlpYaEjdyWHbAwjezsWGhHZxaHk+CZ2Ggz1KZ3Blgh1JQUHGGrztOaBTZU0PtXRgvpe/BCwxv7iLRkp7vcW37noUDGbmKpag1+bEIt7qVUBkQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 27B5C341EAC;
	Fri, 09 Jan 2026 11:37:13 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/3] mmc: sdhci-of-k1: add reset support
Date: Fri,  9 Jan 2026 19:36:57 +0800
Message-ID: <176795841877.55102.17822704198758960955.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Dec 2025 10:24:48 +0800, Yixun Lan wrote:
> This series try to add reset support explicitly to SpacemiT SDHCI controller.
> Previous it works well for eMMC due to it's already initialized at brom or
> bootloader phase.
>   The controller has two reset lines, one connect to AXI bus which shared by
> all controllers, while another one connect to individual controller separately.
> 
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: sdhci: add reset support
      https://github.com/spacemit-com/linux/commit/7c2b0e0b04c42dfa838c35833d2b4be11d0c8351

Best regards,
-- 
Yixun Lan

