Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654C1AE844
	for <spacemit@lists.linux.dev>; Sat, 15 Nov 2025 04:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763180516; cv=none; b=KHpNjXJS2f/sivPTJalDz12IAX3xOKkaM4XDHouDQwQzpVVJoXCQ5YsgnMdq22q2lsJuQguIPGRST2MxGEorijs9obSL8EShOKLrSTtCa9tJbO7ZhHUq5rylPeyWsOS0aes+ode7CVN1DHC+Nc0R9f4myQWgFYtoMZ3KEn/yIzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763180516; c=relaxed/simple;
	bh=W7Q6wmI9qY9hFy3y3Yc0H0YKLHAJOByL64hTBS8BJ6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKVWjSXpzr4Hy37ZQmJfPAfApcw0hXC88qZlrwzusQWCLZdBSdNd5MFs7LNh8b+MSzeGcrMI8vkaAFjgZZ/kCLd70WtmySnviZo72nsv3K16yN69j0qvkbZNPVDJVe8sMqhW4DSdxSNo3Vrz8/YTHgb/F+L3rXzSeyvoxdxWNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ipw5tVdT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ipw5tVdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763180514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n/tk0v+4BBK6qP0Q9YzuiptrPfp0eR+Hy5aITCdFIu8=;
	b=Ipw5tVdTexLVBE3gaaRrLbizjcEfV1YLPucMZvteERrkfqWv2fVM6FB41MuyKqyWlzVCLl
	T/B2F9OlMubLeaCq+yoUfZp/CxGbhb/6AH3nHD0dJuxqqv5u1tGCbQ+43OO86cYe19n3PK
	1NPu8PDMWkSycYtTZSuOn1vf0+SEm1E=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-gBo0xL9KMnWVWzDOe3un1w-1; Fri, 14 Nov 2025 23:21:51 -0500
X-MC-Unique: gBo0xL9KMnWVWzDOe3un1w-1
X-Mimecast-MFC-AGG-ID: gBo0xL9KMnWVWzDOe3un1w_1763180510
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29555415c09so33707445ad.0
        for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 20:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763180510; x=1763785310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/tk0v+4BBK6qP0Q9YzuiptrPfp0eR+Hy5aITCdFIu8=;
        b=gjagFd9YKGX8yBoXTzRN0+51eY5ciwqbNOD2zWUG3vNeLqqpWcmnEplWhlktHaUgzb
         mcYDazfdN368oXHlx/0Cvl3u46AjFSJx9BWfRx0NKaIX8qTlIqDxD+eNYaqMhKE6WyAt
         xf2hIDygGBcEVbSG2nRRjI2oTKW/fZ62oQZ+lrKoJJg9BZYvZS3oCfxWxpmIQC1a+F8i
         SbKOIX/3UbuPxkTbp1xNFYFVJJNU0WjGi44LfwMV2UkDfePjD0gbQcFK+uMYi4ucvmAl
         ZJAAQjQnEjSkh7ae4wfFTXNVDLcUrSMPhG3t79JTIT3ZaSXQgdgCVJbCgaSJTNufaVC0
         QH3w==
X-Forwarded-Encrypted: i=1; AJvYcCXMw1IF3ma2nZ8SyVDvNGMKm4ml6XZ2bmhlzxzqHUJXgEkbYMTjKixmqawWDRE9lJKSm4AFAiYizg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg4y0WC1U2X4MuztlMckvV3UgzTx1GMhOS/8y+Xxrh5DjXNCSD
	Rh9/SHynFgCapR60tMbdXbvAvV66UjrTkERbTyidU1QEJ7/+ycd4Z/3UwUtfnfqjkW3xHZVyqeT
	+T8ep8AEl1prF6G+tCJVZYdCkg2fhc7VYGDRdb+qcsTMBG0w6WVTh63oGUm+aCjKjZn8KhBaL4o
	yCl+LFnhbXPsM/EuBOAoBc8yuDsQPaSKslYDw=
X-Gm-Gg: ASbGnctLffyYcXpKGojiAMn9CK05Bwbe2piugBUIlGvoCkQcg1/w6va2VJ6Yhhpc6rs
	aQ/IYbQLdpPGpnWLidk/nlBIP09ljN0KFPcippP3U0WyZgr71ZX1xs4BwkEM0eoPJtCGl64AT2n
	/vTLrx3Z6MuNDF67B73SxN1uk5y2YFrG4EnuhdYrLLzstAAMkzfe240qEk
X-Received: by 2002:a17:903:120b:b0:295:987d:f7ef with SMTP id d9443c01a7336-2986a6b5698mr58952835ad.10.1763180510154;
        Fri, 14 Nov 2025 20:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpWOiKe/yoXVPzbbB8ra3b08yL+JrFximT86RMx9yWBQlaBgFV6FIkea9RBX9X7EoOn4xsE8DGGa3NwoDYNSY=
X-Received: by 2002:a17:903:120b:b0:295:987d:f7ef with SMTP id
 d9443c01a7336-2986a6b5698mr58952445ad.10.1763180509717; Fri, 14 Nov 2025
 20:21:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251113214540.2623070-1-elder@riscstar.com>
In-Reply-To: <20251113214540.2623070-1-elder@riscstar.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Fri, 14 Nov 2025 23:21:38 -0500
X-Gm-Features: AWmQ_bm8Az7GW4XBfoBLWD-9SdtXqiB6zadKcTvspIsW8QHKFXbXxVXEFbaU15U
Message-ID: <CAJD_bP+AjhNCB6kCeKdnXERjP9j8dhbCejnS1OVmFf_VShti5Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Alex Elder <elder@riscstar.com>
Cc: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	vkoul@kernel.org, kishon@kernel.org, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	ziyao@disroot.org, aurelien@aurel32.net, johannes@erdfelt.com, 
	mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com, 
	shradha.t@samsung.com, inochiama@gmail.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, christian.bruel@foss.st.com, 
	thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com, 
	guodong@riscstar.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O2rNzxF5ZgV8uGz1C6p4_rEPITeaT1V7sgsGL5jt63U_1763180510
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 4:45=E2=80=AFPM Alex Elder <elder@riscstar.com> wro=
te:
>
> This series introduces a PHY driver and a PCIe driver to support PCIe
> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
> one PCIe lane, and the other two ports each have two lanes.  All PCIe
> ports operate at 5 GT/second.
>
> The PCIe PHYs must be configured using a value that can only be
> determined using the combo PHY, operating in PCIe mode.  To allow
> that PHY to be used for USB, the needed calibration step is performed
> by the PHY driver automatically at probe time.  Once this step is done,
> the PHY can be used for either PCIe or USB.
>
> The driver supports 256 MSIs, and initially does not support PCI INTx
> interrupts.  The hardware does not support MSI-X.
>
> Version 6 of this series addresses a few comments from Christophe
> Jaillet, and improves a workaround that disables ASPM L1.  The two
> people who had reported errors on earlier versions of this code have
> confirmed their NVMe devices now work when configured with the default
> RISC-V kernel configuration.

I successfully tested this patchset on a Banana Pi F3 and also a
Milk-V M1 Jupiter by making the same additions to k1-milkv-jupiter.dts
as were made to k1-bananapi-f3.dts.
I no longer have problems with NVME devices like I did when I tried v3 and =
v4.

Tested-by: Jason Montleon <jmontleo@redhat.com>

