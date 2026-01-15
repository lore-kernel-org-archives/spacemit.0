Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD563793DB;
	Thu, 15 Jan 2026 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768476318; cv=none; b=iK8hnZYSkaVNQqdCiODyfX8a7dcuEXyYbX5zWSb591Sca8/YQKQuNoZ015TOCVWtFCN4yO5NvZ2sssRl0NHpcxURP8aToEDOnqtnqRx761aIb0jNwMjhz4h+EvsJ3OBlVg1sH1EXGYyg4uFQjDh2K33/QORiUoaBKaAGq4L39kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768476318; c=relaxed/simple;
	bh=B7PuUbXLWy7tl2Fur0m21K5Rid4K0ANkn6cmSohDoGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHn/t6cvVjewrwRiugc3vQnL0aCUQAI5P9w3igyM3XwJ/90C741ID8u+3CrvxZ6p85gPcz+fUYa/neWbu+HMtNYn7OHPioWpj5aU25PZU62yRYLgLb5ne6f3wRZ4ggFvXTF+IG3BtDss1n1rqu5Srzl314MQYFXPbn7GTA5mXRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfVg6P0p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfVg6P0p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7565AC16AAE;
	Thu, 15 Jan 2026 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768476318;
	bh=B7PuUbXLWy7tl2Fur0m21K5Rid4K0ANkn6cmSohDoGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IfVg6P0plvu0QThEcQfXdt0D50Ofu64z4L2RBMAAv9Wv6AmF+p8KbaqmqiVTCuts9
	 M5INO265jFD8nMLXeEIp5xA+PerY3+Rjqdl2pkIVhe8z3KGPPcuLRFk1TLqJwQfbiW
	 lJKcFJ7+kqdTuzsBffFhWdIbfdTbJAlZHRRhPepR0+x5dKYJNRbR54oxHRm6C3otvK
	 gLmoVvU1QmC0eJAINslSSK/ZWRUmrezlOrcKd06OjJaa7vyA+r2cXhMtYQU9kPlQ7n
	 KNJi1JmYG9cJ/7EGhRcUO8j4pQx4qI+KPyMB2XHPGjGRnCrsnVPTa9Rx8NejK3u2lt
	 LmXH+VUkOud7A==
From: Yixun Lan <dlan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Thu, 15 Jan 2026 19:24:51 +0800
Message-ID: <176847501553.23847.653353060495870563.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied, thanks!

[4/4] riscv: dts: spacemit: k1: Add "b" ISA extension
      https://github.com/spacemit-com/linux/commit/eb241eb29bad28cd17c5a4b9c355645e96094713

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
