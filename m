Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3ED2EB859;
	Tue, 13 Jan 2026 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290828; cv=none; b=D3OBEXF4GPk9iEJf3y4t+EINV2ReEjyU9Uilmo+LmnI5jpFi/9CW6xIeNGaaoand1iP4o43OvmuAn/YRJxrEk6tMQ9+o6S4zt+UZYGlqHpbTh865mwRpPOL3kWeyvuNaRjjXKVQCGspWEi/mYWVkbHw+PWvwPttKY+mGS+ti91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290828; c=relaxed/simple;
	bh=h5+vouM/Jp0/qproZWkjY885M2rm4+ktQAA3Wl8iWbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf4uTqxaIj36YGag0+iXKzfx/Bg4ScuyrzgIdOfNQ5u6POrUbeyn3GTId16B2OAwPjQ0Yn3KDKcGH9uUw3+S0gpVhJj8haeilDdMnlOc5lqr8yc0KTOJcuuZhbYZQUKayACHNusExXBxvDVOIkI5wyeVubU856S8750q0QmKuaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3969B340E6C;
	Tue, 13 Jan 2026 07:53:43 +0000 (UTC)
Date: Tue, 13 Jan 2026 15:53:39 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: Add "b" ISA extension to existing
 devicetrees
Message-ID: <20260113075339-GYA25466@gentoo.org>
References: <20260113-adding-b-dtsi-v1-0-22d6e55d19df@riscstar.com>
 <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-adding-b-dtsi-v1-2-22d6e55d19df@riscstar.com>

Hi Guodong,


On 15:45 Tue 13 Jan     , Guodong Xu wrote:
> "b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
> (Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
> checking rule is now enforced, which requires that when zba, zbb, and zbs
> are all specified, "b" must be added as well. Failing to do this will
> cause dtbs_check schema check warnings.
> 
> According to uabi.rst, as a single-letter extension, "b" should be added
> after "c" in canonical order.
> 
> Update existing devicetree files to conform to this rule. Line balancing
> is performed where needed to improve readability.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/boot/dts/anlogic/dr1v90.dtsi     |   5 +-
>  arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 256 ++++++++++++++--------------
>  arch/riscv/boot/dts/spacemit/k1.dtsi        |  32 ++--
>  3 files changed, 147 insertions(+), 146 deletions(-)
please have separated patch for different SoCs, so they can go via
their own SoC tree.. thanks

-- 
Yixun Lan (dlan)
