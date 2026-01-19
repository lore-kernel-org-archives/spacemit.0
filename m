Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF3824DFF9
	for <spacemit@lists.linux.dev>; Mon, 19 Jan 2026 02:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768790590; cv=none; b=jfXfTNmL5zIiOqd7IgUNaGuI++pTg8JIMUGzMxbDq2/pUfSyAqqFR25vyR/zn95i/Z+OnNPxe+/QFPD+gJHUaGM6nYbUpARbz2PpTfu/j4jwBmAViTuW+9MH59GnpKVe6143DkRs4nHweY60bYZ8ivuMyo9HtgjJk8D6Sgcul4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768790590; c=relaxed/simple;
	bh=dxMuG8DeCk/MNox26jkJHJiBwaVmNN8vz3C1Um8Q1aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qALxXXNvcE1tP57Ts60p/PsZJvjnsDl0m3e0pUayc7RY6M+7viQD8X7AjcueyzJMNvgAvTpzqWF4ivIyWf38XbWpbkbczQoLpuzH8nKC7AQVi5WhgR73rOMr4khJtLxLXvucSF8+EDFD8OuJCTSLZ8QHsnV6lThFNgniv9meK8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6FF5D340D48;
	Mon, 19 Jan 2026 02:43:06 +0000 (UTC)
Date: Mon, 19 Jan 2026 10:42:55 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for
 OrangePi
Message-ID: <20260119024255-GYC47382@gentoo.org>
References: <20260116100001.208334-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116100001.208334-1-amadeus@jmu.edu.cn>

Hi Chukun,

On 18:00 Fri 16 Jan     , Chukun Pan wrote:
> The OrangePi R2S and OrangePi RV2 boards share many similarities, the
> difference being that the RV2 board has more peripherals, such as HDMI
> and Wi-Fi. Create a dtsi for shared parts to reduce duplication.
no, as I checked these two boards having too many differences that
I don't think it's worth trying to create a shared dtsi file

> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 69 +----------------
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 69 +----------------
>  arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 76 +++++++++++++++++++
>  3 files changed, 78 insertions(+), 136 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index 58098c4a2aab..393270641b04 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -5,22 +5,11 @@
>  
>  /dts-v1/;
>  
> -#include "k1.dtsi"
> -#include "k1-pinctrl.dtsi"
> +#include "k1-orangepi.dtsi"
>  
>  / {
>  	model = "OrangePi R2S";
>  	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
> -
> -	aliases {
> -		serial0 = &uart0;
> -		ethernet0 = &eth0;
> -		ethernet1 = &eth1;
> -	};
> -
> -	chosen {
> -		stdout-path = "serial0";
> -	};
>  };
>  

-- 
Yixun Lan (dlan)
