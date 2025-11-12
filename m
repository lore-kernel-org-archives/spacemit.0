Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5E22D97B5
	for <spacemit@lists.linux.dev>; Wed, 12 Nov 2025 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762929437; cv=none; b=qsKEG3z469zcObknaL3291JdDRu5PG/x35K1UJrq8TY4Hxc9WP45IpI+vGsjgKzHGNYGu1p8xNDraWtkqZbU70+fHs1SQiia9oMj+oXsu3XLzgt8NmIaUOvKp97P+h1BwIoQz7GNVRnnowt/pct4TAiEBgg3cxozZkdz/x2M4NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762929437; c=relaxed/simple;
	bh=JnovqX2d8PjMw7/74aR9yABXeIKXajAr1ScoI7eKji8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS2eQ1LdD5IbCUbFn0zp93Iwt/USdUqLTPn0aAM4rl3IEVjSsuVYEK8TdgQyVoRuHbep6T7xlg0gap8VrEcOyZJtdduJ4s1Mpd1biBYhxB2cWiOPG9uQ5uyjQfloAaK/eyDz0j0pVDavPES+g6FAu8Xe43ZpwiEMtIpK+ArTTf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8D31B340F28;
	Wed, 12 Nov 2025 06:37:14 +0000 (UTC)
Date: Wed, 12 Nov 2025 14:37:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S
 board
Message-ID: <20251112063710-GYD1677982@gentoo.org>
References: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
 <20251112044426.2351999-2-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112044426.2351999-2-michael.opdenacker@rootcommit.com>

Hi Michael,
  Thanks for the new iteration

Hi Krzysztof,
  Is this version addressed your concern? I would like to queue it for
v6.19, but let me know in case you still have objection..

On 04:44 Wed 12 Nov     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Document the compatible string for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is in fact identical in die
> and package to the SpacemiT K1 SoC [2].
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 52fe39296031..9c49482002f7 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -23,6 +23,7 @@ properties:
>                - bananapi,bpi-f3
>                - milkv,jupiter
>                - spacemit,musepi-pro
> +              - xunlong,orangepi-r2s
>                - xunlong,orangepi-rv2
>            - const: spacemit,k1
>  
> 

-- 
Yixun Lan (dlan)
