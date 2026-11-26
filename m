Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697635;
	b=LdsUj4JPcV4qTPOb/T72+c0vKvqUdpxNOQsHB5pRyHxWEX3fBO5dpS17wdgVYSdyt4TA
	 080yMez0RTH+gykwIfiyXlRdZgZYni9SoFDRI+vO3hyL9n/1DVdWG1cfaHjh/XPRTjsGT
	 2uE1b/5BChQ6EQcC8hD3spJ5bTXkBB8UqowLXRCZOQhbRp7Xl+0Ufq+Km0FlxNAI4MJLy
	 MJChhAm3QstSy0grQt9KEdDKtaXVSHzw0Uvf05l5oQ3tbNF+/QQ4KWTnIq1GTTNT10Uvj
	 ma0SEaJi5yB5c/qsvWlnAwuQFWNiKdX6Fgf4b/ByqoriAt8v0JFbkIcYWUZfeFEUpHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697635;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=O+d5676T5CMcSy/94TsW5KMv0BgyZ1tcN/EjPiQ8WdI=;
	b=3ebu92v4dK3sv+VoIGS+re6ldks8FXCsLQBJdzP9udHe1RDA/A7kIP7w1R77lqEwUCYC
	 xL+BU3uXIy9A38lxlYLSiRK+tQQJ0oxKgRdpxp3RzpEaR6I/Nz8BBPrPqhp/KdTZdznVr
	 OqxQ9aFWzJny/yJIXM1FwHcjM/o7r6XeUxEv3E8fi4PJQYHd4RfQ1TeeTfG49tByj5vx8
	 DCeWLYbOxkyrFUQBcKVH07CoSCgZiTmHAXmDbodnRtphQbXKZtVHIPCZPvZEzFCgvs0M6
	 PH4ha8x4GwZf6OHghb3iTOWm44qqdw5bSd5M+Z3l9dtvbwsQdJ1va8X4+QKeWIDNYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTEegIdj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D1606A31C;
	Thu, 26 Nov 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTEegIdj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDBD1F000C4;
	Thu, 26 Nov 2026 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697634;
	bh=O+d5676T5CMcSy/94TsW5KMv0BgyZ1tcN/EjPiQ8WdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fTEegIdje0HvM2qaftMcVv2uLKABRroZ03kJ9XkK3T/hbWBTyB8VuriZGtZlekyPs
	 jNX3hzvZrkFe4yK8iTXBxn4tJHhAX9amXLpa4x8QSjvIO4M+VnhIYOOGQy2MsKGfqv
	 y9qTWIXFWA9qDoDRnXmnCQt1WPJY1av60tKgCpbVjJfqux/laPrY3qrcMuMpROQVf9
	 mjL4VlrO5viC9+dbpDD/CsjmTAkB9wZOPVcYWIEnyWdjywwrL0/8Y1t4KbXnFbcphm
	 FaHjP3c37mfU+rTGFPy/fs7Gs+FduZa+fdtfsf5ZSjGyxTfvDUV8FVgPyqaXaQfkQt
	 lENMWEMyEiLDA==
Date: Thu, 26 Nov 2026 12:53:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: add PowerVR GPU device node
Message-ID: <20261126125351-GKA2398@kernel.org>
References: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>
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
In-Reply-To: <20261118-orangepi-gpu-v2-1-f68676f844eb@gmail.com>

Hi Iker,

On 19:59 Wed 18 Nov     , Iker Pedrosa wrote:
> Add PowerVR Rogue GPU device node for SpacemiT K1 SoC.
> 
> The GPU is integrated within the SoC and enabled by default.
> 
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
