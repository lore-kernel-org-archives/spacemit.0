Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B2D1E2307
	for <spacemit@lists.linux.dev>; Mon, 10 Nov 2025 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780210; cv=none; b=eauhjW4Ty1VGzXkUyhxbFd6SGYRhdNIjS60jHv4G8oi870pElbYt+5djaNHelbZRfi23Dk1SXy4RR3P/4/urZfAaO1484wX9DGT3qKen1/f7ZG5JQ0QJtPQa5Gk5nzq7NeJsIN5sEvvsLDylaRHSG7Fj0L9jKlUHTejqvuCGH6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780210; c=relaxed/simple;
	bh=tNXjfnpRZ/iYm4udCeZvjepqnWRdflkL1gvUCRboRdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/5bJC67mVM7XkdaK5JGbhUNLyH+VBQ63yZgAKkzbSQKSaGVu3IA22e2P9/yPL3N/MBvi4lbbi0APxVfoD1pbwQTCdC//t/l30d8/s2o+x6yL7aC1qkXnp4zCt/ng383eiK8u1xZ6kmXG//BR1UJZNJWG7KHW+NEhJTJw6WETIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8221C340DB0;
	Mon, 10 Nov 2025 13:10:06 +0000 (UTC)
Date: Mon, 10 Nov 2025 21:10:01 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S
 board
Message-ID: <20251110131001-GYB1651402@gentoo.org>
References: <20251110101110.948198-1-michael.opdenacker@rootcommit.com>
 <20251110101110.948198-2-michael.opdenacker@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101110.948198-2-michael.opdenacker@rootcommit.com>

Hi Michael,

On 10:11 Mon 10 Nov     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Document the compatible string for the OrangePi R2S board [1], which
> is marketed as using the Ky X1 SoC but is in fact identical to
> the SpacemiT K1 SoC [2].
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index 52fe39296031..1b2f279d31f9 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -24,6 +24,7 @@ properties:
>                - milkv,jupiter
>                - spacemit,musepi-pro
>                - xunlong,orangepi-rv2
> +              - xunlong,orangepi-r2s
with Krzysztof's comment, you should put this new compatile before
 xunlong,orangepi-rv2, see

https://lore.kernel.org/all/20251110-impressive-dalmatian-of-luck-4d1441@kuoka/

>            - const: spacemit,k1
>  
>  additionalProperties: true

-- 
Yixun Lan (dlan)
