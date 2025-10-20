Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB12ECEA3
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 09:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760951614; cv=none; b=eS8c2dICdIRL7D+b/gBD0Ik2pbXxL4Inidq3+kIwPBdhfkD1/xJjgDZqYjvzIhY/rbmZ93FD3PurDQfZDpvtuH+0KVlVT6ZlbITJ8J4VigUmYz6exBrU9PGsJj4ex1vZzHLrFMTMO8Pv/3+/Xw//CwH9+IAuSOvrQQyWp8pqC4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760951614; c=relaxed/simple;
	bh=6EwU2dVYKxyTFOF2o3dUU14lADkQPAc2CAa7NanmeRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJp5zMXoAYHutBp1hpF8NJPQVqUhg7WyZl5TScjfoqtf7N/x1KyPwfDdLXPknMlDVOJQTEtc3rEv4+QNxkMZlLagSrmHODt+d0wX3vy/XjdKIXckEFCtCBfA7qkkXo8nxxy1Kv4JhpaJHSs7zqk2+/E2BS/5Qtxax0DTMQteG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.107] (unknown [114.241.85.109])
	by APP-03 (Coremail) with SMTP id rQCowABHknzW+_VoMALlEQ--.23805S2;
	Mon, 20 Oct 2025 17:07:35 +0800 (CST)
Message-ID: <002e0b15-57b6-4433-a9fe-8b7ce4b8dcd9@iscas.ac.cn>
Date: Mon, 20 Oct 2025 17:07:34 +0800
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
To: michael.opdenacker@rootcommit.com
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
 <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251017100106.3180482-2-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:rQCowABHknzW+_VoMALlEQ--.23805S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4ftryrKw15JF45KryUWrg_yoW8Wr45pF
	W7uFsxJ3y7Jr4Iqw43Xw1Dua95WFs5Jr45W34a93s8tw1YvryF9r1xKwsxGF1UKryrXayU
	uF40g34Skw1qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8IJPtUUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Hi Michael,

Thank you. I had meant to do this after v6.18-rc1 (which is now), but I
didn't have this hardware to test.

On 10/17/25 18:02, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> Aligning with k1-bananapi-f3.dts
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 337240ebb7b7..2a75ca93b499 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -33,6 +33,56 @@ led1 {
>  	};
>  };
>  
> +&eth0 {

Please add eth0 and eth1 to /aliases so that U-Boot, udev, ... can
recognize them. This is used by U-Boot to set the mac-address to the
same value used in booting, and by (systemd) udev to set the interface name.

> +	phy-handle = <&rgmii0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <0>;

The hardware design of OPI-RV2 is not the same as BPI-F3, so the
parameters here deserves some scruitiny. Same for eth1 below.

I would appreciate at least iperf TCP tests in both directions on both
ethernet ports. The expected speed should be at least 940 Mbit/sec - if
it's much lower than that something is wrong.

Thanks,
Vivian "dramforever" Wang

