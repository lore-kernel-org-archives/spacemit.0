Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7324061F;
	Sun, 24 Aug 2025 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756021024; cv=none; b=FSkVYChlBuDgwd02T0pdiNxMWTG2m/r0YDtgT3elOi0rSvW3v+QJh1IHos7dmnwI0iifKK2OiyGNXKvr6ZYYFKXt4Iv5uXwdIb7W5UUFEB2WRBfUiR+tp51/M7fceu7POCxGvTSK/IkGGUykmLYqXpFeoVa+OGqQ4+FNjmbgtf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756021024; c=relaxed/simple;
	bh=nbh1fZpe36WdEto5iFgq2/Un1zMvq/DRH0ahJK8sLFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEjV5K3DhMldksdriX//x/wozwhPyJxrjqA5wgNQi1R4FD1cYaTnWprR9+OgcRvbHQX2AYNeOzHIuWWVL3souIAfLxLTosdnlFC71cNx1JIocFCNoZGWdOTBlZp+f/YJi0PVPM8sfteKkG0Bg5+6DHGIX7ndDHiP7G18pl9oE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E1311340DAF;
	Sun, 24 Aug 2025 07:36:57 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: add UART resets for Soc K1
Date: Sun, 24 Aug 2025 15:36:42 +0800
Message-ID: <175602095097.196581.656734670747058634.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821152619.597051-1-hendrik.hamerlinck@hammernet.be>
References: <20250821152619.597051-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 Aug 2025 17:26:19 +0200, Hendrik Hamerlinck wrote:
> The UARTs in the SpacemiT K1 device tree are probed by the 8250_of driver,
> but without reset lines they remain non-functional.
> 
> Add reset control entries so that the UARTs can operate when mapped to
> devices. UART0 is already de-asserted by the bootloader, but include its
> reset as well to avoid relying on bootloader state.
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: add UART resets for Soc K1
      https://github.com/spacemit-com/linux/commit/eba84c94f9597a82f143997bfacc75e5b27a37de

Best regards,
-- 
Yixun Lan

