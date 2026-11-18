Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983667;
	b=Pyzy88CExMvTGWJ0mdwft4tX6DFlgdN3rgdTwY/E7+L5GP7TgRQoIYk5XideN9jlkQD5
	 gwUk2m32/fJz0kW9S2M5TbQs6M+QbG+WY7gID1m4liph2bPGcYiTF8rtxpqFH8EUJT1rO
	 aX3nOaQI9aFUOQRY5kY0pcZzCfuOd9eSGqFHF//pSyA2Zb8/wSjyR5GRCNhfXK+HDcNSS
	 AbN41np9c2/wepERqhOhYAYbhx9dvP5Me/uoTqE9+iQzk4xBrW6OPOTyR86BERi70hQmY
	 YmDBgxZXWJTICJy0C7NVg+I9DAoANL2byR5uYQ1Yrq0HhEWZIfmBuxa6x5gpNU5XNpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983667;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2fdla1NYjjCieel0GDgyV2h5zcu99JPKuhUzM+in2nI=;
	b=U3qVpluuPBV3dQ3AMpNXq/rArWrB83jH4S92f6IollyCAuQC+1GmH0cpAgPOD+2uB+3e
	 aRDHKC1oVkRBf657JzMIPsRPv5h8y4/yakEgbEYpnoKl1HOe3duN7K9XwOj765BfOQIKv
	 yV32zhOLDfjzeKVeOoUI/IXlsz487eQTPL9Jv/HBTPxSPE0O4Y1o95yZWqTmE4B18Wh5Q
	 hNFs1vu7z+GJ+xqruY/h+ik9KPk660WU0abcQ66iTFfzUHqc/0fsY5jkAM2JQCwB8JG30
	 F/hDFYjimTmtDdeGy9ph66XpCq7AuB7pPAC12oZkCIwq6L8ye9dS9ibjcslJE0jOvCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3CqjKIz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8C0606A325;
	Wed, 18 Nov 2026 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3CqjKIz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEEE1F000C8;
	Wed, 18 Nov 2026 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983666;
	bh=2fdla1NYjjCieel0GDgyV2h5zcu99JPKuhUzM+in2nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E3CqjKIz0iYatvK2Lmib4agpv8+7BNEEwdvY5jjKdnRn+vKgGa/P/jB2QQzQobRZY
	 sk0NHrJWfxHUdPi1N2vdcZZXq6GakntsC1Uxk1N+zQsYIHoz9FmSNdvLlRWlaCVoWP
	 TmCz4lq7ZPlwDt1jgzI8ubci12UNc2SkwuKmS5r6v4IvH9skvfJ3wx41C0tVF4aV3F
	 X6vYOYo/SRFFxDUtfL6fMYFeV0vzhq+oif3UFMHxjJBt38QfjO2gPzNLe7LbhEGL4w
	 IjW3+dlL3MsMNEXFT7BPrm8q2MKPem3pR4yeuotPmzmCjmCOdno6lHdsf7zoHi5B/8
	 gPleBnCF0merQ==
Date: Wed, 18 Nov 2026 06:34:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Message-ID: <20261118063424-GKA155714@kernel.org>
References: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>

On 13:43 Tue 17 Nov     , Sandie Cao wrote:
> This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
> regulator tree, add USB controller and USB phy, Enable SD card.
> 
> This series is rebased on next-20261116.
> 
For the series, with

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
