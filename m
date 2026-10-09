Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517BD3D4123
	for <spacemit@lists.linux.dev>; Fri,  9 Oct 2026 07:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529408; cv=none; b=IuD0fLvCsO4bKH9JZJTU6HfdFvWZnD8lZ1fP5rI6rTuL2mRRVSwNzxd8OAO2DjooxpKQt4e8DU9ouMCpfknKsO2+Xj2PpkryRBhJTb/XFLiCQSNmCj514nWsa3f3xqs7z+WTV8SnwBhnd+lmRhp7VFWAQIAzhdEdQXL4nYlglfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529408; c=relaxed/simple;
	bh=YCjt9AAtTIvqfU3nPvMGB0s7mW58Yu8S5URPMeEzCJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7GQKzgX28rXGvn9prIA7Vn+A3tY1iZm0UV4644EZPMvTnzjy1hfO2dbe++WWVdwkTeSzGqKQbl7h96AuPsTQZcO34aWDzJ9mh9N170Wsm3EDeFThbfpeIkM1HH8qhBVkO2VOLooezNxnxod6OUL0HdZcMmu7VvKa2FDkquPLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0UUG9Lr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0UUG9Lr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765781F000FF;
	Fri,  9 Oct 2026 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791529406;
	bh=FVbVr/SLj/ahirgwJPH49+h2vyuJJWceItNKNu4cfWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H0UUG9LrVxWiR5osaJaTUfEgeaZ1vYhwlWE53TBZv7WTqeQnjU3hiPvrbhTF08p9p
	 6w+et9ptweWoMYzkxr7RTyo5p8RRNrGD5C6YSSdYNOWCV3nW9cULzmqGKAg802HCsn
	 y6Wv8qmmAmEEfmyr1LEBGTRGl/ufgo47FvWQSDgUlsGZ8y+zUzCUbzS9xcn5Ds3lYO
	 z6YQZSd5aLEa5mg7hQJRPUCMFsObzqD9Oq1i/5C/9tQPbe+75ypZ7pMpi5h3viJaas
	 M4IXSEVdFMB8csHAcNU6yNFuVd8KLHZE/A7ZnVk1Gz4TFQQfhHGLFC33svSeVeDkNJ
	 cgGG0/e3cgxaQ==
Date: Fri, 9 Oct 2026 07:03:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Jerome Forissier <jerome.forissier@arm.com>
Cc: Tom Rini <trini@konsulko.com>,
	Jerome Forissier <jerome.forissier@arm.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	David Lechner <dlechner@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	fanyi zhang <fanyi.zhang@mediatek.com>, spacemit@lists.linux.dev,
	u-boot@lists.u-boot-project.org
Subject: Re: [PATCH 1/2] net: dwc_eth_qos: spacemit: add support for K3 SoC
Message-ID: <20261009070324-GKF2005@kernel.org>
References: <20260924-02-k3-ethernet-support-v1-0-b8e1fafc9249@kernel.org>
 <20260924-02-k3-ethernet-support-v1-1-b8e1fafc9249@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-02-k3-ethernet-support-v1-1-b8e1fafc9249@kernel.org>

Hi Jerome Forissier,

On 01:53 Thu 24 Sep     , Yixun Lan wrote:
> The SpacemiT K3 integrates a Synopsys DWMAC 5.40a Ethernet controller.
> Add the platform glue for selecting the MII, RMII or RGMII interface,
> configuring the internal RGMII delay lines through the APMU, and
> managing the controller clocks and reset.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/net/Kconfig                |   8 +
>  drivers/net/Makefile               |   1 +
>  drivers/net/dwc_eth_qos.c          |   6 +
>  drivers/net/dwc_eth_qos.h          |   1 +
>  drivers/net/dwc_eth_qos_spacemit.c | 313 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 329 insertions(+)
> 

Ping for this..

Would you have some time to take a look at this patch?
and let me know if you want to take it via net tree?

-- 
Yixun Lan (dlan)
