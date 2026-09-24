Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387DD374E7A
	for <spacemit@lists.linux.dev>; Thu, 24 Sep 2026 03:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220279; cv=none; b=Qzu37mxMFCD2mHzvXK9MVdBL35x/NjdKYf85ycxG74jfvaJV+qVwU8ggfs9cw1xxv/TZyUc87W8ZyLHfM4cxHPUVLOHGtoGum5RDj74od7SxOkAdNbv2+cVHd7U2NEDYTI1DUaAqzw9Q/7DfTJb7WI1uNDSSQWo8U9oxmgy+F+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220279; c=relaxed/simple;
	bh=TSJwIZEQBiiKCclqiO4vGgUkeHfQ6b9u06l1H9mPHa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vh8s5X84tc7q3BG8gTiUKI05h4mHT/0Cd2CIJrmFeii0p0Wbot84p9BL46XBPMrs7bSsVkk1pz30G9HPJB7lzELkpRrIqPrlJza/e039Qfst0prI47vsi4sxfaARuVc9/30Dhmm+qACxm8DUWtcMHPoF8+n+Y5zRnL29/nAw984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=FQBy5sn6; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="FQBy5sn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1790219650;
	bh=/vu8mh58GGAlm+LcHARrm4cBM+Y1krDOfecjJSJfelE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FQBy5sn61XEVOv0yK36Kwfr9MlEwK2vpRYfMfUwhSL50LEsWY2P2LhrBTXMxkYptt
	 bRFPJ/P1CC8G/WIxafsoOuSQSnkPsFwBlW80O47uLUskSNw85jB1kXDEiMq7eUW7yP
	 FIDGx/p4dEu0rV7AUIZdD5Dd8N/8ioRfyggpAMlllC979HCIl42fDsHmircZPAL62N
	 A04NWZ+j3Wbbi/eEdY3p5px2+d0bi2MiDVhVmseYezWhXCjYZKy5ab8YluK4eHu/K4
	 C94mNgADUTqT8++DCjCylDQ3nSOZAG9nBgu8/iH4ailUbDU4WwwEIjetjZcK18M3YQ
	 SdjiLFi/MthWw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 434D8B22044B;
	Thu, 24 Sep 2026 05:14:08 +0200 (CEST)
Message-ID: <e4c84eac-01e6-4955-865c-56d8fb733498@freeshell.de>
Date: Wed, 23 Sep 2026 20:13:50 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] configs: spacemit: k3: Enable Ethernet support
To: Yixun Lan <dlan@kernel.org>, u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>, Jerome Forissier
 <jerome.forissier@arm.com>, Quentin Schulz <quentin.schulz@cherry.de>,
 Peter Robinson <pbrobinson@gmail.com>, Johan Jonker <jbx6244@gmail.com>,
 Julien Stephan <jstephan@baylibre.com>, David Lechner
 <dlechner@baylibre.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
 fanyi zhang <fanyi.zhang@mediatek.com>, spacemit@lists.linux.dev
References: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
 <20260924-02-k3-ethernet-support-v1-2-b8e1fafc9249@kernel.org>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260924-02-k3-ethernet-support-v1-2-b8e1fafc9249@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yixun,

On 9/23/26 18:53, Yixun Lan wrote:
> Enable the SpacemiT platform glue for the DesignWare Ethernet QoS
> controller together with the generic PHY framework, Gigabit Ethernet
> PHY support and the Realtek PHY driver.
> 
> Enable DHCP, MII, ping and PXE commands for network configuration,
> diagnostics and network boot. Allow U-Boot to generate a random
> Ethernet address when no valid address is provided by the board.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  configs/spacemit_k3_defconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/configs/spacemit_k3_defconfig b/configs/spacemit_k3_defconfig
> index 6ca41aecc41..3a70a0a4858 100644
> --- a/configs/spacemit_k3_defconfig
> +++ b/configs/spacemit_k3_defconfig
> @@ -24,10 +24,15 @@ CONFIG_SYS_PBSIZE=276
>  CONFIG_HUSH_PARSER=y
>  CONFIG_CMD_GPIO=y
>  CONFIG_CMD_I2C=y
> +CONFIG_CMD_DHCP=y
> +CONFIG_CMD_MII=y
> +CONFIG_CMD_PING=y
> +CONFIG_CMD_PXE=y
>  CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_FAT=y
>  CONFIG_CMD_FS_GENERIC=y
> +CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_SYSCON=y
>  CONFIG_CLK_SPACEMIT=y
>  CONFIG_CLK_SPACEMIT_K3=y
> @@ -35,6 +40,11 @@ CONFIG_SPACEMIT_GPIO=y
>  CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_SPACEMIT_K1=y
>  CONFIG_MISC=y
> +CONFIG_PHY_GIGE=y
> +CONFIG_DWC_ETH_QOS=y
> +CONFIG_DWC_ETH_QOS_SPACEMIT=y
> +CONFIG_PHY_REALTEK=y
> +CONFIG_PHY=y
>  CONFIG_PINCTRL=y
>  CONFIG_PINCTRL_SPACEMIT_K1=y
>  CONFIG_DM_PMIC=y
> 

Please also enable for this series: CMD_WGET DNS NET_LWIP

We can intentionally leave WGET_HTTPS behind when there is no
hardware-specific DM RNG driver implemented yet. I do not see a reason
for the legacy network stack instead of LwIP; LwIP appears to be working
well.

In my test I start a simple HTTP server on the local network host:

$ python3 -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...

Next from a Sipeed K3 Pico-ITX 32GB board and your mainline u-boot series:

=> dhcp
ethernet@cac80000 Waiting for PHY auto negotiation to complete........ done
DHCP client bound to address <10.20.30.40> (38 ms)
=> wget http://host:8000/mini.efi
##################################################
87962624 bytes transferred in 7414 ms (11.3 MiB/s)
Bytes transferred = 87962624 (53e3400 hex)

With that,

Tested-by: E Shattow <e@freeshell.de>
