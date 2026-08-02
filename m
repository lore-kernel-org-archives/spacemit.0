Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDA3175A9C;
	Sun,  2 Aug 2026 02:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785637135; cv=none; b=ntrG7HHZGDtCq0F9BhTICtadXEr80rp81UdShhrvN2rGwa0SFJyAtHPwyVLT/9y5gq1oDQHr0fiYijrmofX7CEhDcsTTkMcZNdf6fABrtPUoSP/UwssQs+t/0MBqJzFa1EKWJFq8MLsBWFTRt0FiwNbF1jT8vlWPFd6HMzk3I/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785637135; c=relaxed/simple;
	bh=ejm0/PcCM9UP+12YLf0ZzrwpSY8e01aJM3g6HpEkUAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pZXXGfkIYaOsuJtYyOx40t/EgoDZvqGAdF59RM2vAPM/NNdvH+9YmiRow3vU8L7p4WFyrsAcqjVtKwxdvSehd8luj6AwYM6licWaI5PdB0zBYrlzr/MX4Ms7bvt61mMkFE1TaNhC2kdh3PImnki3vevA3D7JJthuQ2kRy9g8g1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVXWPbTU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVXWPbTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9710D1F00AC4;
	Sun,  2 Aug 2026 02:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785637134;
	bh=ha/y3iJzugwKfDfSEUohk4Wr/4wbO8BU3nBFbQbxb4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nVXWPbTUEXgWkUO0Zk9bfXhP9uVCNbNV8mgtb7OTKNWdUOhf1x6CVgOAqKFMSFi0b
	 VQaewISYmEZnK+PNaIb/LwUPkuXFQ/W+0tXLL7cc/uw7LmcUdtt7sjZcywTE3rLaIG
	 A/dzU2nGm/v/eOj7gyJUHp9k4UJLzxuD7+ErAqYeT5yxM4ACK4fsxM/jFskATZ7866
	 dJL8xhKb7TWVvyF06sZEOTpb1py500buhABf4+ymjWv0QXpXc3N6vGwzjNDIDXry26
	 J7uGYjk7QL5g5BWgRtkAfI3o20mA4n/lfr5zbKd6njqhCCQCYDwZ4cVSa1NREXqVqQ
	 cJZUXmIb2QTtw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
Date: Sun,  2 Aug 2026 02:18:47 +0000
Message-ID: <178563711049.1616541.10192420990220597678.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729012418.154652-1-inochiama@gmail.com>
References: <20260729012418.154652-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 09:24:16 +0800, Inochi Amaoto wrote:
> Since the previous commit does not change the phy node name,
> the dtschema can not recognize the type of the ethernet phy,
> so the following error is produced:
> 
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): $nodename:0: 'phy@1' does not match '^ethernet-phy(@[a-f0-9]+)?$'
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> /arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: phy@1 (ethernet-phy-id001c.c916): Unevaluated properties are not allowed ('reg', 'reset-assert-us', 're
> set-deassert-us', 'reset-gpios' were unexpected)
>         from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 pico-itx board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=9b371a8b13fd0e8e6f3b12f4ef7e58927d6f62ee
[2/2] riscv: dts: spacemit: Make dtschema recognize the etherent PHY correctly on K3 com260 board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=bff5af3c934740481a316c5ae1cd4a09a43134d0

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
