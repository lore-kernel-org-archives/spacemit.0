Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13BC346E57
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515460; cv=none; b=Lh5U3ossKdTS2CFX/Mt38ypRwovU+UxLsoAnSHdgH17REytT8+1cHwbKm1eWJRp3lXxZKnn/JjhprzabvY8TrgxATvcJxtKTWw1fExkvNOJBHXoeo4QVXoKeXcfjIE9ZYxovyNrOvVVpzgTWG6r3xeglicgv7WJsW+iYqvzzri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515460; c=relaxed/simple;
	bh=CYCKnxhioDRbqRac4wq0l2WJYiayLKvejrNQS00kNb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=s5XoxOnG4avE04IYUhiamc6/+GdZgxT7AqJ2OQN77Wx1YGMkiRM7XzQNktBifY6L8vjrKulTuBXdqg/9+HT9W5pikICi4HSgXiGl0FJpbtNKndmb6u+fkQ1PEI4a7k5lLtIGz+s//jdofos5Hjdgk+Rqt61UOv5OFHPea9SiUUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oymjH/VJ; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oymjH/VJ"
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774515456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LeMHr0vQhEqNCiIKwsjdNZuAZi/ehFggVflJyU2swJM=;
	b=oymjH/VJae0r8yWcQwTxer+tBfPHSqNf+gIzDk0yXoYH5lcNkO0Vg8qvcUcjsXrjoHqD+F
	8GFTSup1x5vIqCLYxdt4IIY82haWJmX1XZXytWYyZLHALrJzvph/hTIDlUi1BkGilaYGwF
	4RVcFbq9nf/9fyq6EYl0DdatxeU0xH0=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 16:56:20 +0800
Message-Id: <DHCL7BLD4KP9.2W648STZ3YV7E@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Felix Gu" <ustc.gu@gmail.com>, "Vinod Koul" <vkoul@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Yixun Lan" <dlan@kernel.org>, "Ze
 Huang" <huang.ze@linux.dev>
Cc: <linux-phy@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] phy: spacemit: Remove incorrect clk_disable() in
 spacemit_usb2phy_init()
References: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
In-Reply-To: <20260326-k1-usb3-v1-1-0c2b6adf5185@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Mar 26, 2026 at 12:23 AM CST, Felix Gu wrote:
> When clk_enable() fails, the clock was never enabled. Calling
> clk_disable() in this error path is incorrect.
>
> Remove the spurious clk_disable() call from the error handling
> in spacemit_usb2phy_init().
>
> Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/spacemit/phy-k1-usb2.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/ph=
y-k1-usb2.c
> index 9215d0b223b2..e8c1e26428a9 100644
> --- a/drivers/phy/spacemit/phy-k1-usb2.c
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -97,7 +97,6 @@ static int spacemit_usb2phy_init(struct phy *phy)
>  	ret =3D clk_enable(sphy->clk);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to enable clock\n");
> -		clk_disable(sphy->clk);
>  		return ret;
>  	}
> =20
>
> ---
> base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
> change-id: 20260326-k1-usb3-f6a52f413616
>
> Best regards,

Indeed, thanks for catching this.

Reviewed-by: Ze Huang <huang.ze@linux.dev>
