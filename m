Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551FB32C85
	for <spacemit@lists.linux.dev>; Tue, 28 Jan 2025 02:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738032086; cv=none; b=NG1ALzWlZjLZbYzG34EWOnvjcr+wUUtKHFhgWy0q22t+nknZzdpq3cx56mNYiy/ITnVI23XQdLLlKWNSTak60SYwMhvT5NpJa6ThyCfhW8EeSCF86gE/o5SezGcx+p18sZMPPvCYu/gGMzIWX794PnlbQ2hG65ZDC8cCtDSt3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738032086; c=relaxed/simple;
	bh=QsZFotQgKDOlLBKfwgaGZq0NXWyvU7kZDwZsaqECxxI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=AJZLqkuOiE3z2CxoT3+n9HfJVdkctMiEjubk1I5x+hpX9ahj+CSWafoZICSzbbVDZDLZYpn33Rm6CLsFbeNWBmmeZqXsVm9djHHMqQAN1eA5B5TdLVgaAPaZiryzGgaUVRKn3Zx7Y5nn8fy1oOtoOMXGNOJkvWPKSdkE+ByrXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org; dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b=ToOoXmAF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contractor.linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contractor.linuxfoundation.org header.i=@contractor.linuxfoundation.org header.b="ToOoXmAF"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f757134cdso5692162e87.2
        for <spacemit@lists.linux.dev>; Mon, 27 Jan 2025 18:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google; t=1738032082; x=1738636882; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=ToOoXmAFw/BP5YH1pweB9bCSfVIhZwxZRIM90gzLZKp0H2bDLrISBAGOwLJQhgDj5T
         mUlNajGUftTiobUYCe/Kz2mBWugL3d2wynC/9jK9xs1o+kakOfqtI90ArP5AV42IHKDW
         Y6rnYif6Zq52La0wzchLbS9UotAo9+Sq+jrr6AjYHejgrP6umehlRlzodFMapAnrQcoN
         heFg8CepRGx40vWAo2w9Mh6/SaRuPblTf5qa35qfxpbLZtgQmY5WphFfZgVZ4yCkalc5
         Avx9vYuFkJn9MQl76VAN9wUNavYT8G33Buki6qIwWckZIA08HhTASWl2+MR4KjPjZy8Z
         +FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738032082; x=1738636882;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=wmKOadN2dXFItN6ahHGIv2aKjRsASSOAUb9DMPVp2GTUBUn2G3dXcbGIAoJcjrQiQB
         dYA0NNa8uIblfaYDcEggcST1R6EYZINaGrfk4+wkYUxzzKxCEHA2SujmRI7Y9GDAaQBx
         eljeTV8O2JBoW497O+9BYmLES+lwVc5F8qBaF4V4jtd18YotaQCyLVdodDtFPP/IrNml
         zLOvFEDyByuKYTBmRkbndB4UquEYoK1MBXt3vdhgE3LpPFy03e0tDeCePW5jzjo+IBkP
         CwsS6vhsOb3roSbvwLj+IOZYQ2i4DbtUyA1UM6p9W3dBXsxuVIgcj0fA743zht/pvwuH
         qPYw==
X-Gm-Message-State: AOJu0YxUX0mRlznn9CRVKtPP/syEp7vsw0CgWbQrIZlfqAHhPskywizD
	lV4g9q5vnGyznH1kkKCvfpPaCNVYJvWGh6NeQvimqRgF2ldXtkFcLeDsbnTaujZKUz4zESqf04E
	Kz0nKbHvwkltvXEsDj4RuEk8XTyvq0O493+UAQVSAvP+TtD6t5dI=
X-Gm-Gg: ASbGncu+VmCqPhRNFNpEQBwRp8J1lcapiNeYBju3WrrFFj+VjNJxery+stnjKsTfkOV
	6ANDl3uAnzBRz/0zRAcMC1TUyTJxvUSgdGlo/U9zhQZ5PlfGdUYVi9fm+WpyRvb2cJtH8jwVtEB
	+GYWRTK7FkFg==
X-Google-Smtp-Source: AGHT+IGOYELtp1pqe6bqlrM0euwkv0bNQk1oZNupNf+VhgI7F23rW7/5yRcIKMpHskdHvec4aB+HLeXHdS1TVrWTkGw=
X-Received: by 2002:ac2:4e11:0:b0:542:29a6:a063 with SMTP id
 2adb3069b0e04-5439c27d18emr17751591e87.43.1738032081871; Mon, 27 Jan 2025
 18:41:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Tue, 28 Jan 2025 08:11:11 +0530
X-Gm-Features: AWEUYZlH9djAjXNgVPGmRgqt10BrE4VskX6hKB9EqxLhmP-NYJ54FCx36GoI5Z4
Message-ID: <CAH=dH9-oSnYFbJFsuZWB+pR3PAEA3aNZ5PeUh6nxtm9DtBNS=g@mail.gmail.com>
Subject: Test mail
To: spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
