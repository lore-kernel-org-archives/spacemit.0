Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8883386C0D
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699298; cv=none; b=dTcLGPaQfItmR7Sr9j/ylPnY6MQJvzf+ekn7h/gLbEAAlfBpHAIfWwxnhn66/kQwvlI1Fl+cU0Hh4FZB4IuzSw2/LqNNa889dd4aRF5UprXbZBIIlGwKCs0aOfE/KaRyuryDNUfGaKjRDy8L2wMoX5XYTmWC+GJi84PlBpl5T8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699298; c=relaxed/simple;
	bh=X+CM6CcZvtG3xrXzA+E7vFdnehcFp/XJxB85EcmWIbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WrCDstKBQ3rlAKZERrQstNuzE5zX7pbI346zFUbVsLGQYzuuTQ0eO3GIDOr8FRAGhX42B4+IkhMUC6huHS4kVRnVB9u9zzIhDI3As7TqbU3aFW7T+Lj8Y0bNkQAeWZAQP8D0n6GfxPsU/xzBZN01cskVFG/xFVUiuxHQBRIfizA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=uP5DkVUq; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="uP5DkVUq"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90004d2f7b7so16323376d6.1
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699294; x=1784304094; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BJ1o73BxjtDCU3tES64jvElPh2pTfJj5ck4Dt4zpj7w=;
        b=uP5DkVUqWHhDieyxC1rdD68jQMQWxRBlF9hhBIJoV9KkXqVmM+2/bbx2wUyuLiDs8D
         DGf93yYvcQvNIuuFmtSJG5f5w3QZH1bV+/ODGa0IKdKt6HsMbEZ6eUT7PBXRh24DpOHz
         k555O2p78FnuDfwbkP/9NgRj15TO2tjy/1i4RlHX27ZLisEcAh7dHaDKXa+9F0ilQsHv
         CPKFyH9T7+dJhXSlUZjcIBd+wUIzmL/VKWoke3ALAvqizeqKgunLzy5862Z239WM0WTQ
         JvPHu+eQU6cEZeFU9/VKnAdF7HMjDG6aYz91IEbQxyEFYv7/gt8rW1H3lGPhN8Tj9ZJN
         B0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699294; x=1784304094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJ1o73BxjtDCU3tES64jvElPh2pTfJj5ck4Dt4zpj7w=;
        b=GnVhDvdl3DafCSFizMIQR/IpYx96/0NGI5OO9nGBerNQHekQ3+/K9KnAp3YXfP5v2g
         /uxHIwvmpgE6dYDEoQPNGZ8xGA+Yv4OX7IQv1RIRBiffBDGXl4/rjoSPG/1GguTjvBCH
         oRqfDdHmRIzEWPcNCRPuOJ/8GqvFPqTyMy7Hre6tIXWPrmVgtfnNHyGUXBzumzjv9aEB
         5HXMwhUvvtHbqOo+0TPC2ox7+Hfvr09RilmeVyJiPxTP7nKth9LUZfAnj6OAWXM7zC21
         Fa6Bt0Ol6pllkvYwcFqqVZytAy2GyyDgBWvj6ISABsNQbRUEeRQw2sDCYXvZQbreewwO
         BRMA==
X-Forwarded-Encrypted: i=1; AHgh+Rpzqx8wW6rjog0xaE6Ugcuv4sOrk4m/IrLyrkMm38ab5xcCU+0azItxloWT8WzNyhYgXHWQAjNSgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCZEBYshZAWmPnX1l74l7bsGUha4s852Cv5eiWrJ2Qw4O37l6U
	CWyVYImSa90znmZHRC0KGbH2/RojCn2XU1rRxnnxRCdiU+K7mSgtwG/HEJo22GQmw7U=
X-Gm-Gg: AfdE7cmKPHLW1sK2GEDBljohU0fQ90RMXyekY3Oe8+WsoWAivDkB1Uqy0DLrWT57esO
	BkkimEAoMyfMP6p11jpc/AJaheoqbfcrQ4nqnvagDO5CbXTwO4tbeJbKEiWlPnVWES6IeoiA/9+
	8tDpp5Do3Y+axyCarHyTNQIS9OJzip3y669ixeNqKTAmTdf5mlRJTJRq4Cd14p8zYtqSMZDCek6
	Rak6GuV4YO6T7ZRnFFP1RA/C6UIUH5LZc8scXb5P93wio+mLxisOu6jr4lScEVFlQsiUl+0FBWi
	+9KBWH/6MZ0pyZ0QFjPUvS7SSvJNa2Aya699cHjzXWmpHpmqE62uwFOvDofFA8+oWvKc9DUj3QV
	R/1MVelvHbljmDmmJ1oUIrGbTc+djFVuQScOuKfXLE06gszMW+RbadrJv221vz6cxZ8M7VKASI/
	M6U7fjyrTDVZ1L
X-Received: by 2002:ad4:5f86:0:b0:8f0:f35c:23ab with SMTP id 6a1803df08f44-8fec189aed8mr127228496d6.16.1783699290317;
        Fri, 10 Jul 2026 09:01:30 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:29 -0700 (PDT)
Message-ID: <cdf06f51-5df5-4322-bd25-a33a3f0a3788@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:27 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] PCI: spacemit-k1: Add device id update helper
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-4-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-4-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> Both K1 and K3 needs to set vendor id and device id, add a helper function

s/needs/need/

> to simplify this.

I think someone might have commented on this, but I expected to find
that the next patch would fill in the code that's needed to support
K3, but that patch is at the end of your series.

The reason I say it here is that I wondered while looking at this
one why it was needed to create this helper function.  I now know
that k3_pcie_init() will call it (but I had to find that in the
last patch, which was later than I expected).

Your series should start with DT binding changes, then code changes,
and (often) end with DTS changes.

Anyway, this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index e22ecbd09579..31aac056b68e 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -56,6 +56,7 @@ struct k1_pcie_device_data {
>   	const struct dw_pcie_ops *ops;
>   	int (*parse_port)(struct k1_pcie *k1);
>   	unsigned int max_phy_count;
> +	unsigned int device_id;
>   };
>   
>   struct k1_pcie {
> @@ -186,6 +187,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
>   	dw_pcie_dbi_ro_wr_dis(pci);
>   }
>   
> +static void k1_pcie_set_device_id(struct k1_pcie *k1)
> +{
> +	struct dw_pcie *pci = &k1->pci;
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> +	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>   static int k1_pcie_init(struct dw_pcie_rp *pp)
>   {
>   	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -201,10 +212,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>   		return ret;
>   
>   	/* Set the PCI vendor and device ID */
> -	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
> -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
> -	dw_pcie_dbi_ro_wr_dis(pci);
> +	k1_pcie_set_device_id(k1);
>   
>   	/*
>   	 * Start by asserting fundamental reset (drive PERST# low).  The
> @@ -406,6 +414,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
>   	.ops		= &k1_pcie_ops,
>   	.parse_port	= k1_pcie_parse_port,
>   	.max_phy_count	= 1,
> +	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
>   };
>   
>   static const struct of_device_id k1_pcie_of_match_table[] = {

