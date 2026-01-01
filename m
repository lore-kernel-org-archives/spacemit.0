Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01CF2C11E7;
	Thu,  1 Jan 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265699; cv=none; b=Yfi5BagGSXY5Lpq8t428f/9UzGyj2KTvJWkAKj01WTYkpfkn1JBttUoidVuwMFLM1pPRbqq3XF0BoXcEZWjxh6npixnqaQtkgWZ+lbXNMREkLrx3zINabaRM+ILbfe9U6R4UdGg36lNg1o9RLrSHYD0NmvweP3s4t/JEfWcSGek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265699; c=relaxed/simple;
	bh=3vaei/sb4rRmaAM32GbT3y9z3sM0igMG4DfOPhlluSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ry9AlHUBGrEYn3oal/V7KNmBJ3r+wFpawb+3tY01uc5lpLPf7g8Grj5xd5QQMF0QOYWjgbPfUEdoL/1reCGD2MsLDizYp7ZLrxKo493EoeznvyGLMfX7ng1+4vVqKgdj/X6k5i8te+qTP5qTHf78N+wpR9FH0phISIbJiKrEpZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOIHDwpy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOIHDwpy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C36BC4CEF7;
	Thu,  1 Jan 2026 11:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265697;
	bh=3vaei/sb4rRmaAM32GbT3y9z3sM0igMG4DfOPhlluSU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HOIHDwpytqpPEntMiXTtTqNLwL/AWkk5lnVzoRTfToONZZoRUmf5lgO/goH9KYxdm
	 DmMwGeNNT7Xp0234TNJlVwAyFexDXn+42kz9noU3Hr51pXAVWDIg2HBgUwSXQIS4wR
	 FN3DYkYBXOvyX1dQiVlG3N4CXpzz4UwJzspZYcV0bJnWVt3t869+KgZAI3fB8LKF4D
	 7UzduxE6iPs7C8SH7lx1fKRrXr6DUx74UMFn1WYN7XG3dvNoIuZsPwDUs6O8yUibr6
	 ZlyALsDgUiyMY5TKd3Qe3Ob1eWfm+dC9KmFYA2jE0LR+FIqSKWLhxyZ1kmuYDmWujs
	 fR4K48mefwz+g==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Ze Huang <huang.ze@linux.dev>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
References: <20251017-k1-usb2phy-v6-0-7cf9ea2477a1@linux.dev>
Subject: Re: [PATCH v6 0/2] Add USB2.0 PHY support for SpacemiT K1
Message-Id: <176726569400.201416.7844610224983761844.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:14 +0530
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 17 Oct 2025 22:49:51 +0800, Ze Huang wrote:
> This patch series introduces support for the USB2.0 PHY on the SpacemiT
> K1 SoC. The implementation has been tested on the Milk-V Jupiter and
> BananaPi-f3.
> 
> K1 includes three USB ports as follows[1]:
> - A USB2.0 OTG Port
> - A USB2.0 Host Only Port
> - A USB3.0 Port with a USB2.0 DRD interface
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: spacemit: add K1 USB2 PHY
      commit: 61b84d5b20af2a4c9944972202c1386026598928
[2/2] phy: spacemit: support K1 USB2.0 PHY controller
      commit: fe4bc1a08638309b6be1af37210930b856908eb7

Best regards,
-- 
~Vinod


