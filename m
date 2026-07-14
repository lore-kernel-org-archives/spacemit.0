Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A3C3F4829;
	Tue, 14 Jul 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784020209; cv=none; b=lFFwKI90HS5vMsgn2NoPvSGXVMkE3Fg52T/Ghuc8nAsBbBChCf4P0E5iKh8Xpmw1HRa0CqJhwe91zEn9QAoa1+SmE4+bbKyIklHknko3AL/CqcVYj8/U9LLlMpM0LM5ScVA7XttxKn2PXxztXvbaq5JdaHd6gYXA0nxbs1DFkiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784020209; c=relaxed/simple;
	bh=ClbGW+XGjZ/fQugTtNXfE5bZIgYXZ/rHqa0wN56YvQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CakImQExE4lzbBHx9As97yib7WnIIz1+dQgZIW7qYSJic8T2l9S3lRL4niXydZE68/i13p0raqBJb2325rbgFjb/Lxm6G1j+2Z6pG6HDoiyHT5lhqaer+HG4Mhlmi/48o5jKysBRhRSaTagj8jiKxtcyuD7fZgqoAF3rHJrBGqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZqi6nsA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZqi6nsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238BF1F000E9;
	Tue, 14 Jul 2026 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020208;
	bh=V28WrlVcLhHenO4/n9XjQ5Tw/iutUPxfCf4Ex0Jl6Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eZqi6nsA8Hoy2MPOuro1Ybre0ychdoZJY1US0kVo1Hr+lMNqRux/ruy7BB9NEq9I+
	 WnTt3o/+ChH7lRtLx/XCylmMvjHylSHbWCmuQGa5blWDbN/B33wc2a/kvTo0xHNerB
	 jKBMUMfu8gvU+bR7Ma3puRf0a+WGAg1Cvtb2OAoF2Gsg1cq3ln0VJL3lLTUaYsZgCL
	 yW+pR0Yb+rDNdhjmwgBb8jbgUVr8AwOpRb3UJdpizlEyxGOE1Hlm09RoiR6Ej2psmQ
	 by6SU8IGfjNarWMlihDtxAv3rIaA6MbANrgEnnvR4eqA1zfpJ8PPOKsJA2yJvYHHIP
	 326Hh9Yick8gg==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/5] riscv: dts: spacemit: serial/i2c/ethernet improvements for the K3 Pico-ITX board
Date: Tue, 14 Jul 2026 09:10:01 +0000
Message-ID: <178402012051.1567515.12651523506378538429.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204431.498700-1-aurelien@aurel32.net>
References: <20260623204431.498700-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Jun 2026 22:43:44 +0200, Aurelien Jarno wrote:
> This patch series tries to improve the K3 Pico-ITX board DTS by configuring the
> default baud rate for the serial port, enabling the 24c02 eeprom on i2c2,
> adding aliases for i2c2 and i2c8 ports, and enabling power saving features on
> the RTL8211F PHY.
> 
> Changes in v2:
> - Collect Reviewed-by tag
> - Fix issues reported by Sashiko AI in patch 2
> - Link to v1: https://lore.kernel.org/linux-riscv/20260620062238.3199108-1-aurelien@aurel32.net
> 
> [...]

Applied, thanks!

[1/5] riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=84a9b686f24490e9340961c913072df7fc9518a1
[2/5] riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e08ab32f61b1fc7c35253b708f3840530a2c13cc
[3/5] riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=6e59ab1a2b4539cda3677d4927a08609be28de6c
[4/5] riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ca259920d5551b0c68e5dc188a2f0118baa151ec
[5/5] riscv: dts: spacemit: improve RTL8211F PHY configuration on K3 Pico-ITX board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=ccbfb13d278abbde13e544316e961d3ab03a77c8

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
