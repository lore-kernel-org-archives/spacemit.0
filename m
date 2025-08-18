Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63332038A;
	Mon, 18 Aug 2025 12:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519962; cv=none; b=E5Hxz1Bj0fNufd/Ob4HbJktw8gbkk5i/QJiVuoS/Zfsj4qLGtF1NUPqm48qv1ACDu1vYyzPuyNg04IoiiQ+skshP7RKZ67C6jQxw4UG8SEX1hQTNfYUX4KoMS+Ku8qfIfrA85bKSWbGvPx8Dn2Jgnc+aowJ1R8gNoq4wBbhNfAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519962; c=relaxed/simple;
	bh=3D7XiQsF2LRwxTsIiluc2rRY4xp6KZq2KqBz61kwKhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opluERvmmqVoEGqylA3BpjwsqIOMGOWab/lq1/Uca1OKGtdqGEKOmwBrZ9JpFEqyi+4QM2RC2R/yyCIN8eQH66OJix/vhhGvHiw+tYUVN0dLYk7jSvEyX1uUjHR5CQgjfQOJIMO7hO14NorwUA9ggpN0PQ6QxhSoTuK3I8nSQJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [180.158.240.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 84414340DB0;
	Mon, 18 Aug 2025 12:25:54 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Mon, 18 Aug 2025 20:25:36 +0800
Message-ID: <175551987874.16484.811796950493073575.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
References: <20250813092240.180333-1-hendrik.hamerlinck@hammernet.be>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 13 Aug 2025 11:22:38 +0200, Hendrik Hamerlinck wrote:
> This patchset adds initial device tree support for the OrangePi RV2 board.
> 
> The OrangePi RV2 [1] is described as using the Ky X1 SoC. Based on research
> and testing, it appears to be identical or very closely related to the
> SpacemiT K1 SoC [2], as suggested by the following:
> 
> - Similar integration in the Banana Pi kernel tree [3], which uses the
>   OrangePi RV2 and identifies it as the SpacemiT K1.
> - Comparison of the device tree code showing a match to the OrangePi RV2
>   Linux tree [4].
> - Locally tested the OrangePi RV2 with the SpacemiT K1 device tree,
>   confirming it boots and operates correctly.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: riscv: spacemit: Add OrangePi RV2 board
      https://github.com/spacemit-com/linux/commit/f10512e2c44e6ee3242314d43102acab7340e2d3
[2/2] riscv: dts: spacemit: Add OrangePi RV2 board device tree
      https://github.com/spacemit-com/linux/commit/bab8dea259100a99e047fd11a48940b229d30031

Best regards,
-- 
Yixun Lan

