Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D031EFFA1;
	Sun,  2 Aug 2026 02:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785636981; cv=none; b=YiIy4tH2HPPz+3vvgWsMWjJWx3tpdcc6Go17iiIJG/LP+b2RNOLrIhjcjLJuS8Zzkxdm6h4z7Gy0YZG2xZeTwsD5f1XeFsk53O4pWKYTlPMtIlOcMo5JeiWR3DX5UvqGlGrTCjmHUO7Szjp55m4VpSASon9mGQHBiHpAzzC+PfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785636981; c=relaxed/simple;
	bh=nMgYmACM/HXq+w9OheiNysfMMywfkINmQ50/AY0vse8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pSnX3+nWsvkJvf3OFC0JTsoL8OoyIseYN8jjXVP/uxlVvOLBu8xzuK9NjW3vUq4IqlACv6sHcihN+BcyNlLXsLy5cNI67gY3B9adAUYBlDM3lfqKCuyHcO7BFkliJYSRt30BRP+Jr8L3C/gNYCLmyBo4aX5KyCIY5vBh8Xdv/uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iedqZAwM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iedqZAwM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DB71F00AC4;
	Sun,  2 Aug 2026 02:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785636979;
	bh=syTg1fcwNfbi5+9+/wIzUNXHYtBnQxYX3VE0DS+A3yM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iedqZAwMc67Unz1NKNbs3pjfc6ntATb0mD+5gQSbtCr3/MeW3rRrM4tP+fY+bqXID
	 4sv9hy25kl997Ug3SHLaPjQBsCgj1za/p8Gc6XiKrDgHU1/e1hoAdHZ87Pc9aA+pcT
	 jKevLgeC60evxsHw14vK9NpYD4k/4cWSuK7NU+AMcHezVcboGaSvZN1qFRhhkzXnGX
	 StvbwQPIforqEWnsk0YeKczJbTmYoquQw7Orf6qCj+VvpFsXzI135ms0seLQbiU7sn
	 6ojiaNcd5cAi6P07YwwvAcZVeMUT1rBEqqxS3rz8UqKrX0D44hoGGe1Jz5ZcFU4cIG
	 Y4cs4DSfIyhGQ==
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
Subject: Re: (subset) [PATCH v2 0/2] riscv: dts: spacemit: k3: Add USB/PCIe devices
Date: Sun,  2 Aug 2026 02:16:14 +0000
Message-ID: <178563688035.1615748.14235029725495774606.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094726.890179-1-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Jul 2026 17:47:22 +0800, Inochi Amaoto wrote:
> DTS for series:
> https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com
> https://lore.kernel.org/linux-phy/20260703021024.495433-1-inochiama@gmail.com
> 
> Changed from v1:
> 1. Fix clock of usb3d_u2phy.
> 
> [...]

Applied, thanks!

[1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=46380e4b1534c1626cecd7f4d0abb5e0cce09af6

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
