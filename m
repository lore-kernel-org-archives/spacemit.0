Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523385;
	b=hngF7AE6CklSr8Y+Mo3/aZqiMQUmYDQOUChTrD5pWEnC5eGIycF5gNNxGh6Xp03Swd+m
	 fYqPxr8g2GheqSgvSqO1RWQsAtXfFnf6Os+w287GHfuhBH/TV8OpVPICrH2SR5s4uKpnm
	 HNTz0lLQpf/iOxUV82izmV6LMkMENUdDYDRUqR18oiZIL/P3Og7TJaFBi8UQHK8FvISGq
	 hlVuzifHKMRnk+R0NUwFQswzmyj6pHUjQRIKyBymlRi4REQPdqNtMqOpjixHYXGo4ryrH
	 F3+OTS79DZ4npIi00LWviEgsIhcuw4aq4PJPtf9Z3dlZurJjiFY2DFghKxVCq7/2dkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Aa9xIw16gVy0GcSyhGDzNe0nCFeciud8dQ7Mcn7z3mU=;
	b=k4qym3pOhuvLnq5ImGeQMbNbBiqO5Phoj1kSQupiHJfThPJ1b6j2h4bZ/9t9q2WyUOAw
	 EGG/G+hzJOx2jQuNDEWR4WS1wXDeR/ptiDkhOtTQ2+Sl/VTdK/1nGrwHFIiQa4ZP56I/e
	 s2ghecToWq8iMOu8qoUMqITqpp7A44LlDPDoDYJ3yO1b2WL59xD7VDaLDbq9LKnP1IqZJ
	 GztEi+egM4Njpm2QJB+IAkWkDtw8UT8A67Sa0oXSa8TEYPOTLzaLZW0asgaTIJ0pbr9+T
	 8Le/3yG1ATdPPjUgPAkRY2m+RMUe1SxWdPCyFSW5zaeWKzOJZDSEZ3ggEZntQA25nvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irQ3zDUz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD30606A32D;
	Tue, 24 Nov 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irQ3zDUz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A4B1F000D2;
	Tue, 24 Nov 2026 12:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523385;
	bh=Aa9xIw16gVy0GcSyhGDzNe0nCFeciud8dQ7Mcn7z3mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irQ3zDUzKESe/ZV6XYKciROknj8NLqJh8Jmr6ZNbIWMDJlrX8/Iv407ZyDyzuQyn6
	 MWEtLELQZHi0zpu16KYdA0H/aAHk5PbIp70lq/++v59KQARknxUuYMG2Bw3x/rWt7g
	 X69zfj0DVMXoLvpaLJKQxtX7pba4IE+EogZxYz7E13p6SWCF7AV8pl4D99ySmtT4vB
	 6t7KrvfjVx2iYObdEJa61AlJrwawOtTfxN1iO500NUjuF3c7tLrLWSjxUsYPOGFK3/
	 w9yDWese3yG3rgB04QeuxpSBqjefMfx4FcCghzeyqUlL9YwSl/Tvk4f5DOt3r4Rjiq
	 3QUAuxoOEgyIw==
Date: Tue, 24 Nov 2026 12:29:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] riscv: dts: spacemit: k3-com260: Set Ethernet MAC
 from EEPROM
Message-ID: <20261124122942-GKM100890@kernel.org>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-5-138b39d74602@linux.spacemit.com>
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
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-5-138b39d74602@linux.spacemit.com>


On 08:23 Thu 05 Nov     , Troy Mitchell wrote:
> The EEPROM on the K3 CoM260 module stores the board MAC address in its
> ONIE TLV data. Assign it to the module's Ethernet controller, so that
> every carrier board using the module gets a stable MAC address instead
> of a random one.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index f94607cb2eeb..1f5c958c9d6d 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -42,7 +42,7 @@ eeprom@50 {
>  		nvmem-layout {
>  			compatible = "onie,tlv-layout";
>  
> -			mac-address {
> +			mac_address: mac-address {
>  				#nvmem-cell-cells = <1>;
>  			};
>  
> @@ -216,6 +216,8 @@ dldo7: dldo7 {
>  };
>  
>  &eth1 {
> +	nvmem-cells = <&mac_address 0>;
> +	nvmem-cell-names = "mac-address";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac1_rgmii_0_cfg>, <&gmac1_phy_0_cfg>;
>  	phy-mode = "rgmii-id";
> 
> -- 
> 2.56.0
> 

-- 
Yixun Lan (dlan)
