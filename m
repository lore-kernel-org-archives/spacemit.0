Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436575;
	b=tJzL5934qdx58QGoeXVZ66XUiD2UzgHZh2sOH889P1GrOJO7+9+nyQsbj/68X0nXYvi8
	 eb/+ol7y2+eCFfT5jlZUPH2BTASD4Sv9abI7ta+VmoD41NGMOJ/DXHs1jjeY+/Kf48vpl
	 6Td+IDB0cLukMeXTV7d9NnGXmmEehJnNIh63qjLWHVLC1CoEpT3pEkc4KuY/0EBs7eimv
	 k/XoQis7N7QwiLSvg/cyO9kSvBo0wcYZTuaDEtejIXUco+6HMowcsu08moiWJ8fWuZJZL
	 MkyMqtiOZScyc6tKEfoiWev2kgP13DJ0kGXgIJlunavt/IlZPlBkRGCEV/fpj5XeD2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436575;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v3ZXJghUVjeMaPQn4cN/Z1xtE3USOoB0nytfsQJJ3Ak=;
	b=WRtxFxLsUH+hZFOw1XKOLkUUl77BXws74sHNUXyX07Xq/c857qxsoleRAX4ogdcqP9PA
	 c3T1r3iV4UcgQocTotNm90wYbuiN+X7s68qpDi0wWFauZUvlcf8acwtkUvh83iIqXqwvG
	 a5visK/AXLwIm0pykqogT8BMq7wNFIXQ73KDOqVklc5v8UVi48AAc4pC7v28HfOVfYKUW
	 9m5Uh5ibBBx5L/q8m3zzTKTStHPiL0t2K6o4WSOPUSg+VAxZPbypujsdqit/QyIzwfvmq
	 mDhUjL3ltLUEjy9cmroPDyQuaKVOJsEA7TNms7QWrKCbcMlBEHgTt9LXOLbSwt2vtvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kvwxdh8s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1105606A31E;
	Mon, 23 Nov 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kvwxdh8s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4371F000CF;
	Mon, 23 Nov 2026 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436574;
	bh=v3ZXJghUVjeMaPQn4cN/Z1xtE3USOoB0nytfsQJJ3Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kvwxdh8sZZLrNiRaGNJHAeTD3Nn3ZNFKQIiHbCC/WXsVrYVt6hgexABD/CmZTwBa5
	 wbVxC8MBYw6g9XATXqYempsISAOwSRzi97d8ImxgSJj9meOIPAnC/BCnhOweR7GyHD
	 LeZpnp1VFmRPOXz5P8L1bDlKfBSaG0bTn4diXDW94rhE098Xz5rc7cVALWk9+2m7BF
	 Z0zlROQmJL8QMqZOVkcRX/ZEzhPyP8QcpLSoF0W6XFa7HBXabA8YiRSrGfJkECr/6q
	 9aVkP/rztoF+1HsAAQ7WE+dn8CBws0VTdAxdvQeR5z2dNR8nX8fj0GBUmDcqNXN1hV
	 nTb/wkqaWyOXg==
Date: Mon, 23 Nov 2026 13:22:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260 TQ
Message-ID: <20261123-normal-girlish-jerboa-81a5bc@quoll>
References: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
 <20261117-k3-tq-dts-based-on-com260-v2-1-68b337bd8938@linux.spacemit.com>
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
In-Reply-To: <20261117-k3-tq-dts-based-on-com260-v2-1-68b337bd8938@linux.spacemit.com>

On Tue, Nov 17, 2026 at 08:48:51AM +0000, Troy Mitchell wrote:
> The K3 CoM260 TQ board combines a CoM260 module with the TQ carrier
> board. Add its board compatible with the CoM260 module and K3 SoC
> fallbacks.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

